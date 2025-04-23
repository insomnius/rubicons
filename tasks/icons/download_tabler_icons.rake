# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Tabler Icons are released under the MIT License
  # License: https://github.com/tabler/tabler-icons/blob/master/LICENSE
  desc 'Download Tabler Icons from GitHub repository'
  task :download_tabler_icons do
    puts 'Downloading Tabler Icons to rubicons...'

    download_icon(
      {
        icon_path: 'tabler_icons',
        zip_url:   'https://github.com/tabler/tabler-icons/archive/refs/tags/v3.31.0.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{tabler-icons-3\.31\.0/icons/(outline|filled)/(.+\.svg)$}

      category = Regexp.last_match(1)
      icon_name = Regexp.last_match(2)

      prefixed_name = "#{category}-#{icon_name}"
      output_path = File.join('icons', 'tabler_icons', prefixed_name)

      { icon_name: prefixed_name, output_path: output_path }
    end
  end
end
