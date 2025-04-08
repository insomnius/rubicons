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
  # Heroicons v2 are released under the MIT License
  # License: https://github.com/tailwindlabs/heroicons/blob/master/LICENSE
  desc 'Download Heroicons v2 from GitHub repository'
  task :download_heroicons2 do
    puts 'Downloading Heroicons v2 from GitHub zip...'

    # Create the destination directory
    icons_dir = File.join('icons', 'heroicons2')
    FileUtils.mkdir_p(icons_dir)

    # Temporary location for the zip file
    temp_zip = File.join(Dir.tmpdir, 'heroicons2.zip')

    begin
      # URL for the specified version archive
      zip_url = 'https://github.com/tailwindlabs/heroicons/archive/v2.1.3.zip'

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
          # Match all styles from v2
          next unless entry.name =~ %r{heroicons-2\.1\.3/optimized/(16|20|24)/(outline|solid|mini)/(.+\.svg)$}

          size = Regexp.last_match(1)
          style = Regexp.last_match(2)
          icon_name = Regexp.last_match(3)
          # Prefix with size and style to avoid conflicts
          prefixed_name = "#{size}-#{style}-#{icon_name}"
          output_path = File.join(icons_dir, prefixed_name)

          # Extract the file
          puts "Extracting: #{prefixed_name}"
          entry.extract(output_path) { true } # Overwrite existing files
          icon_count += 1
        end
      end

      puts "Successfully extracted #{icon_count} Heroicons v2 icons to #{icons_dir}"

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
