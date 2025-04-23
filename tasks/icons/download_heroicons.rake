# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Heroicons are released under the MIT License
  # License: https://github.com/tailwindlabs/heroicons/blob/master/LICENSE
  desc 'Download Heroicons v1 from GitHub repository'
  task :download_heroicons do
    puts 'Downloading Heroicons v1 to rubicons...'

    download_icon(
      {
        icon_path: 'heroicons',
        zip_url:   'https://github.com/tailwindlabs/heroicons/archive/v1.0.6.zip'
      }
    ) do |entry|
      # Match outline and solid SVG icons
      next unless entry.name =~ %r{heroicons-1\.0\.6/src/(outline|solid)/(.+\.svg)$}

      style = Regexp.last_match(1)
      icon_name = Regexp.last_match(2)
      # Prefix with style to avoid conflicts
      prefixed_name = "#{style}-#{icon_name}"
      output_path = File.join('icons', 'heroicons', prefixed_name)

      { icon_name: prefixed_name, output_path: output_path }
    end
  end
end
