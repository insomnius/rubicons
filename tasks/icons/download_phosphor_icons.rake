# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Phosphor Icons are released under the MIT License
  # License: https://github.com/phosphor-icons/core/blob/main/LICENSE
  desc 'Download Phosphor Icons from GitHub repository'
  task :download_phosphor_icons do
    puts 'Downloading Phosphor Icons to rubicons...'

    download_icon(
      {
        icon_path: 'phosphor_icons',
        zip_url:   'https://github.com/phosphor-icons/core/archive/refs/heads/main.zip'
      }
    ) do |entry|
      # Match SVG files for all styles
      next unless entry.name =~ %r{core-main/assets/(regular|bold|duotone|fill|light|thin)/(.+\.svg)$}

      icon_name = Regexp.last_match(2)
      output_path = File.join('icons', 'phosphor_icons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
