# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Radix Icons are released under the MIT License
  # License: https://github.com/radix-ui/icons/blob/master/LICENSE
  desc 'Download radix icons from GitHub repository'
  task :download_radix do
    puts 'Downloading radix icons to rubicons...'

    download_icon(
      {
        icon_path: 'radix',
        zip_url:   'https://github.com/radix-ui/icons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{icons-master/packages/radix-icons/icons/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'radix', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
