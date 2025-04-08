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
  # Weather Icons are released under the SIL OFL 1.1 License
  # License: https://github.com/erikflowers/weather-icons/blob/master/README.md#licensing
  desc 'Download Weather Icons from GitHub repository'
  task :download_weather_icons do
    puts 'Downloading Weather Icons from GitHub zip...'

    # Create the destination directory
    icons_dir = File.join('icons', 'weather_icons')
    FileUtils.mkdir_p(icons_dir)

    # Temporary location for the zip file
    temp_zip = File.join(Dir.tmpdir, 'weather-icons.zip')

    begin
      # URL for the specified version archive
      zip_url = 'https://github.com/erikflowers/weather-icons/archive/refs/tags/2.0.12.zip'

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
          next unless entry.name =~ %r{weather-icons-2\.0\.12/svg/(.+)\.svg$}

          icon_name = Regexp.last_match(1)
          output_path = File.join(icons_dir, "#{icon_name}.svg")

          # Extract the file
          puts "Extracting: #{icon_name}.svg"
          entry.extract(output_path) { true } # Overwrite existing files
          icon_count += 1
        end
      end

      puts "Successfully extracted #{icon_count} Weather Icons to #{icons_dir}"

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
