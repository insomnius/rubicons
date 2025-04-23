# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Ionicons 5 are released under the MIT License
  # License: https://github.com/ionic-team/ionicons/blob/main/LICENSE
  desc 'Download Ionicons 5 from GitHub repository'
  task :download_ionicons5 do
    puts 'Downloading Ionicons 5 to rubicons...'

    download_icon(
      {
        icon_path: 'ionicons5',
        zip_url:   'https://github.com/ionic-team/ionicons/archive/v5.5.4.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{ionicons-5\.5\.4/src/svg/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'ionicons5', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
