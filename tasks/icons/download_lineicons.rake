# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Lineicons (free regular set) is released under the MIT License
  # License: https://github.com/LineiconsHQ/Lineicons/blob/main/LICENSE.md
  # Only the free, MIT-licensed regular set under assets/svgs/regular is
  # bundled. Lineicons also offers a paid Pro tier that is NOT included.
  desc 'Download Lineicons (free, MIT) icons from GitHub repository'
  task :download_lineicons do
    puts 'Downloading Lineicons icons to rubicons...'

    download_icon(
      {
        icon_path: 'lineicons',
        zip_url:   'https://github.com/LineiconsHQ/Lineicons/archive/refs/heads/main.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{Lineicons-main/assets/svgs/regular/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'lineicons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
