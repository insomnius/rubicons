# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # vscode-icons is released under the MIT License
  # License: https://github.com/vscode-icons/vscode-icons/blob/master/LICENSE
  desc 'Download VS Code Icons from GitHub repository'
  task :download_vs_code_icons do
    puts 'Downloading VS Code Icons to rubicons...'

    download_icon(
      {
        icon_path: 'vs_code_icons',
        zip_url:   'https://github.com/vscode-icons/vscode-icons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{vscode-icons-master/icons/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'vs_code_icons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
