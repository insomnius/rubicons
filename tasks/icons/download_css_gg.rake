# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # css.gg icons are released under the MIT License
  # License: https://github.com/astrit/css.gg/blob/master/LICENSE
  desc 'Download css.gg icons from GitHub repository'
  task :download_css_gg do
    puts 'Downloading css.gg icons to rubicons...'

    download_icon(
      {
        icon_path: 'css_gg',
        zip_url:   'https://github.com/astrit/css.gg/archive/refs/heads/main.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{css\.gg-main/icons/svg/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'css_gg', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
