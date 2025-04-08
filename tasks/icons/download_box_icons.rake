# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require 'fileutils'
require 'open-uri'
require 'zip'
require 'faraday'
require 'faraday/follow_redirects'

namespace :icons do
  # Box Icons are released under the MIT License
  # License: https://github.com/atisawd/boxicons/blob/master/LICENSE
  # Note: Icon SVGs are licensed under CC 4.0, fonts under SIL OFL 1.1, and other files under MIT
  desc 'Download Box Icons from GitHub repository'
  task :download_box_icons do
    puts 'Downloading Box Icons from GitHub zip...'

    # Create the destination directory
    icons_dir = File.join('icons', 'box_icons')
    FileUtils.mkdir_p(icons_dir)

    # Temporary location for the zip file
    temp_zip = File.join(Dir.tmpdir, 'box-icons.zip')

    begin
      # URL for the specified version archive
      zip_url = 'https://github.com/atisawd/boxicons/archive/refs/heads/master.zip'

      puts "Downloading zip archive from #{zip_url}..."

      faraday = Faraday.new do |faraday|
        faraday.response :follow_redirects
        faraday.adapter Faraday.default_adapter
      end

      # Download the zip file
      File.open(temp_zip, 'wb') do |file|
        response = faraday.get(zip_url)
        file.write(response.body)
      end

      puts "Downloaded zip archive to #{temp_zip}"
      puts 'Extracting SVG icons...'

      # Extract only the SVG files from the icons directory
      icon_count = 0
      Zip::File.open(temp_zip) do |zip|
        zip.each do |entry|
          next unless entry.name =~ %r{boxicons-master/svg/(regular|solid|logos)/bx(.+)\.svg$}

          style = Regexp.last_match(1)
          icon_name = Regexp.last_match(2)
          # Add style prefix to avoid conflicts
          prefixed_name = "#{style}-#{icon_name}.svg"
          output_path = File.join(icons_dir, prefixed_name)

          # Extract the file
          puts "Extracting: #{prefixed_name}"
          entry.extract(output_path) { true } # Overwrite existing files
          icon_count += 1
        end
      end

      puts "Successfully extracted #{icon_count} Box Icons to #{icons_dir}"

      # Clean up the temporary zip file
      File.delete(temp_zip)
      puts 'Removed temporary zip file'
    rescue StandardError => e
      puts "Error: #{e.message}"
      puts e.backtrace.join("\n")
      exit 1
    end
  end
end
