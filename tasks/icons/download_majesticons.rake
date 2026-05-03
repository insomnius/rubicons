# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Majesticons (Free) is released under the MIT License
  # License: https://github.com/halfmage/majesticons/blob/main/LICENSE
  desc 'Download Majesticons icons from GitHub repository'
  task :download_majesticons do
    puts 'Downloading Majesticons icons to rubicons...'

    download_icon(
      {
        icon_path: 'majesticons',
        zip_url:   'https://github.com/halfmage/majesticons/archive/refs/heads/main.zip'
      }
    ) do |entry|
      # The repo lays icons out flat in two top-level dirs: line/ and solid/.
      # Line files already end in `-line.svg` and solid files do not, so the
      # filenames don't collide and we can flatten them into a single dir.
      next unless entry.name =~ %r{majesticons-main/(line|solid)/(.+\.svg)$}

      icon_name = Regexp.last_match(2)
      output_path = File.join('icons', 'majesticons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
