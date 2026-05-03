# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Pixelarticons are released under the MIT License
  # License: https://github.com/halfmage/pixelarticons/blob/master/LICENSE
  desc 'Download Pixelarticons icons from GitHub repository'
  task :download_pixelarticons do
    puts 'Downloading Pixelarticons icons to rubicons...'

    download_icon(
      {
        icon_path: 'pixelarticons',
        zip_url:   'https://github.com/halfmage/pixelarticons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{pixelarticons-master/svg/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'pixelarticons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
