# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Heroicons v2 are released under the MIT License
  # License: https://github.com/tailwindlabs/heroicons/blob/master/LICENSE
  desc 'Download Heroicons v2 from GitHub repository'
  task :download_heroicons2 do
    puts 'Downloading Heroicons v2 to rubicons...'

    download_icon(
      {
        icon_path: 'heroicons2',
        zip_url:   'https://github.com/tailwindlabs/heroicons/archive/v2.1.3.zip'
      }
    ) do |entry|
      # Match all styles from v2
      next unless entry.name =~ %r{heroicons-2\.1\.3/optimized/(16|20|24)/(outline|solid|mini)/(.+\.svg)$}

      size = Regexp.last_match(1)
      style = Regexp.last_match(2)
      icon_name = Regexp.last_match(3)
      # Prefix with size and style to avoid conflicts
      prefixed_name = "#{size}-#{style}-#{icon_name}"
      output_path = File.join('icons', 'heroicons2', prefixed_name)

      { icon_name: prefixed_name, output_path: output_path }
    end
  end
end
