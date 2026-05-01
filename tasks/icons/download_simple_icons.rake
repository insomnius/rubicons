# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Simple Icons are released under the CC0 1.0 Universal License.
  # License: https://github.com/simple-icons/simple-icons/blob/develop/LICENSE.md
  desc 'Download Simple Icons from GitHub repository'
  task :download_simple_icons do
    puts 'Downloading Simple Icons to rubicons...'

    download_icon(
      {
        icon_path: 'simple_icons',
        zip_url:   'https://github.com/simple-icons/simple-icons/archive/refs/heads/develop.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{simple-icons-develop/icons/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'simple_icons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
