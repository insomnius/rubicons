# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Flat Color Icons are released under the MIT License
  # License: https://github.com/icons8/flat-color-icons/blob/master/LICENSE.md
  desc 'Download Flat Color Icons from GitHub repository'
  task :download_flat_color_icons do
    puts 'Downloading Flat Color Icons to rubicons...'

    download_icon(
      {
        icon_path: 'flat_color_icons',
        zip_url:   'https://github.com/icons8/flat-color-icons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{flat-color-icons-master/svg/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'flat_color_icons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
