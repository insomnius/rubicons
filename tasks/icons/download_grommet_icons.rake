# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Grommet Icons are released under the Apache 2.0 License
  # License: https://github.com/grommet/grommet-icons/blob/master/LICENSE
  desc 'Download Grommet Icons from GitHub repository'
  task :download_grommet_icons do
    puts 'Downloading Grommet Icons to rubicons...'

    download_icon(
      {
        icon_path: 'grommet_icons',
        zip_url:   'https://github.com/grommet/grommet-icons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{grommet-icons-master/public/img/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'grommet_icons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
