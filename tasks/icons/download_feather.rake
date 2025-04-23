# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Feather Icons are released under the MIT License
  # License: https://github.com/feathericons/feather/blob/master/LICENSE
  desc 'Download Feather icons from GitHub repository'
  task :download_feather do
    puts 'Downloading Feather icons to rubicons...'

    download_icon(
      {
        icon_path: 'feather',
        zip_url:   'https://github.com/feathericons/feather/archive/v4.29.1.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{feather-4\.29\.1/icons/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'feather', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
