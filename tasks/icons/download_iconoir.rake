# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Iconoir icons are released under the MIT License
  # License: https://github.com/iconoir-icons/iconoir/blob/main/LICENSE
  desc 'Download Iconoir icons from GitHub repository'
  task :download_iconoir do
    puts 'Downloading Iconoir icons to rubicons...'

    download_icon(
      {
        icon_path: 'iconoir',
        zip_url:   'https://github.com/iconoir-icons/iconoir/archive/refs/heads/main.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{iconoir-main/icons/(regular|solid)/(.+\.svg)$}

      variant = Regexp.last_match(1)
      base_name = Regexp.last_match(2)
      icon_name = "#{variant}-#{base_name}"
      output_path = File.join('icons', 'iconoir', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
