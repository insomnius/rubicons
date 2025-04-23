# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Circum Icons are released under the MPL-2.0 License
  # License: https://github.com/Klarr-Agency/Circum-Icons/blob/main/LICENSE
  desc 'Download Circum Icons from GitHub repository'
  task :download_circum_icons do
    puts 'Downloading Circum Icons to rubicons...'

    download_icon(
      {
        icon_path: 'circum_icons',
        zip_url:   'https://github.com/Klarr-Agency/Circum-Icons/archive/refs/heads/main.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{Circum-Icons-main/svg/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'circum_icons', icon_name.gsub('_', '-'))

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
