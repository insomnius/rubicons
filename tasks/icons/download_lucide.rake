# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Lucide icons are released under the ISC License
  # License: https://github.com/lucide-icons/lucide/blob/main/LICENSE
  desc 'Download Lucide icons from GitHub repository'
  task :download_lucide do
    puts 'Downloading Lucide icons to rubicons...'

    download_icon(
      {
        icon_path: 'lucide',
        zip_url:   'https://github.com/lucide-icons/lucide/archive/refs/heads/main.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{lucide-main/icons/(.+\.svg)$} || entry.name =~ %r{lucide-main/icons/(.+\.json)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'lucide', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
