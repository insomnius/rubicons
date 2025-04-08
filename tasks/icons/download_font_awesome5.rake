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
  # Font Awesome 5 icons are released under multiple licenses:
  # - Icons: CC BY 4.0 License
  # - Fonts: SIL OFL 1.1 License
  # - Code: MIT License
  # License: https://github.com/FortAwesome/Font-Awesome/blob/5.x/LICENSE.txt
  desc 'Download Font Awesome 5 icons from GitHub repository'
  task :download_font_awesome5 do
    puts 'Downloading Font Awesome 5 icons from GitHub zip...'

    # Create the destination directory
    icons_dir = File.join('icons', 'font_awesome5')
    FileUtils.mkdir_p(icons_dir)

    # Temporary location for the zip file
    temp_zip = File.join(Dir.tmpdir, 'font-awesome5.zip')

    begin
      # URL for the specified version archive
      zip_url = 'https://github.com/FortAwesome/Font-Awesome/archive/5.15.4.zip'

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
          # Match both solid and regular icons
          next unless entry.name =~ %r{Font-Awesome-5\.15\.4/svgs/(solid|regular|brands)/(.+\.svg)$}

          style = Regexp.last_match(1)
          icon_name = Regexp.last_match(2)
          # Prefix icon name with style to avoid conflicts
          prefixed_name = "#{style}-#{icon_name}"
          output_path = File.join(icons_dir, prefixed_name)

          # Extract the file
          puts "Extracting: #{prefixed_name}"
          entry.extract(output_path) { true } # Overwrite existing files
          icon_count += 1
        end
      end

      puts "Successfully extracted #{icon_count} Font Awesome 5 icons to #{icons_dir}"

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
