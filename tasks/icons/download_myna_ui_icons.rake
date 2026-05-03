# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # MynaUI Icons are released under the MIT License
  # License: https://github.com/praveenjuge/mynaui-icons/blob/main/LICENSE
  desc 'Download MynaUI Icons from GitHub repository'
  task :download_myna_ui_icons do
    puts 'Downloading MynaUI Icons to rubicons...'

    download_icon(
      {
        icon_path: 'myna_ui_icons',
        zip_url:   'https://github.com/praveenjuge/mynaui-icons/archive/refs/heads/main.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{mynaui-icons-main/icons/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'myna_ui_icons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
