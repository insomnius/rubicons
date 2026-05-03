# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Fluent UI System Icons are released under the MIT License
  # License: https://github.com/microsoft/fluentui-system-icons/blob/main/LICENSE
  desc 'Download Fluent UI System Icons from GitHub repository'
  task :download_fluent_ui_icons do
    puts 'Downloading Fluent UI System Icons to rubicons...'

    download_icon(
      {
        icon_path: 'fluent_ui_icons',
        zip_url:   'https://github.com/microsoft/fluentui-system-icons/archive/refs/heads/main.zip'
      }
    ) do |entry|
      # Only take size 24 in regular and filled variants to keep the set
      # manageable (the upstream repo ships 16/20/24/28/32/48 sizes).
      next unless entry.name =~ %r{fluentui-system-icons-main/assets/[^/]+/SVG/ic_fluent_(.+)_24_(regular|filled)\.svg$}

      icon_snake = Regexp.last_match(1)
      style = Regexp.last_match(2)
      # Flatten to "<style>-<name>.svg", converting underscores to dashes
      flat_name = "#{style}-#{icon_snake.tr('_', '-')}.svg"
      output_path = File.join('icons', 'fluent_ui_icons', flat_name)

      { icon_name: flat_name, output_path: output_path }
    end
  end
end
