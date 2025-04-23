# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Themify Icons are released under the MIT License
  # License: https://github.com/lykmapipo/themify-icons/blob/master/LICENSE
  desc 'Download Themify Icons from GitHub repository'
  task :download_themify do
    puts 'Downloading Themify Icons to rubicons...'

    download_icon(
      {
        icon_path: 'themify',
        zip_url:   'https://github.com/lykmapipo/themify-icons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{themify-icons-master/SVG/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'themify', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
