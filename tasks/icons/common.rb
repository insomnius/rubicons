# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require 'fileutils'
require 'open-uri'
require 'zip'
require 'faraday'
require 'faraday/follow_redirects'

def download_zip(zip_url)
  temp_zip_path = File.join(Dir.tmpdir, "#{SecureRandom.uuid}.zip")
  puts "Downloading zip archive from #{zip_url}..."

  faraday = Faraday.new do |faraday|
    faraday.response :follow_redirects
    faraday.adapter Faraday.default_adapter
  end

  File.open(temp_zip_path, 'wb') do |file|
    response = faraday.get(zip_url)
    file.write(response.body)
  end

  puts "Downloaded zip archive to #{temp_zip_path}"

  temp_zip_path
end

def extract_icons_from_zip(temp_zip_path, icons_dir)
  puts 'Extracting SVG icons...'
  icon_count = 0

  Zip::File.open(temp_zip_path) do |zip|
    zip.each do |entry|
      next unless block_given?

      result = yield(entry)
      next unless result

      puts "Extracting: #{result[:icon_name]} to #{result[:output_path]}"
      entry.extract(result[:output_path]) { true } # Overwrite existing files
      icon_count += 1
    end
  end

  puts "Successfully extracted #{icon_count} icons into #{icons_dir}"
end

def download_icon(params, &block)
  icons_dir = File.join('icons', params[:icon_path])
  FileUtils.mkdir_p(icons_dir)
  temp_zip_path = download_zip(params[:zip_url])
  extract_icons_from_zip(temp_zip_path, icons_dir, &block)
rescue => e
  puts "Error: #{e.message}"
  puts e.backtrace.join("\n")
  exit 1
ensure
  if defined?(temp_zip_path) && File.exist?(temp_zip_path)
    puts 'Removed temporary zip file'
    File.delete(temp_zip_path)
  end
end
