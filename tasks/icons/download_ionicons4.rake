# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Ionicons 4 are released under the MIT License
  # License: https://github.com/ionic-team/ionicons/blob/main/LICENSE
  desc 'Download Ionicons 4 from GitHub repository'
  task :download_ionicons4 do
    puts 'Downloading Ionicons 4 to rubicons...'

    download_icon(
      {
        icon_path: 'ionicons4',
        zip_url:   'https://github.com/ionic-team/ionicons/archive/v4.6.4-1.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{ionicons-4\.6\.4-1/src/svg/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'ionicons4', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
