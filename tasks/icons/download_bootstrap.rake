# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Bootstrap Icons are released under the MIT License
  # License: https://github.com/twbs/icons/blob/main/LICENSE
  desc 'Download Bootstrap Icons from GitHub repository'
  task :download_bootstrap do
    puts 'Downloading Bootstrap Icons to rubicons...'

    download_icon(
      {
        icon_path: 'bootstrap',
        zip_url:   'https://github.com/twbs/icons/archive/v1.11.3.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{icons-1\.11\.3/icons/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'bootstrap', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
