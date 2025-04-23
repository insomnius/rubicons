# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Box Icons are released under the MIT License
  # License: https://github.com/atisawd/boxicons/blob/master/LICENSE
  # Note: Icon SVGs are licensed under CC 4.0, fonts under SIL OFL 1.1, and other files under MIT
  desc 'Download Box Icons from GitHub repository'
  task :download_box_icons do
    puts 'Downloading Box Icons to rubicons...'

    download_icon(
      {
        icon_path: 'box_icons',
        zip_url:   'https://github.com/atisawd/boxicons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{boxicons-master/svg/(regular|solid|logos)/bx(.+)\.svg$}

      style = Regexp.last_match(1)
      icon_name = Regexp.last_match(2)
      # Add style prefix to avoid conflicts
      prefixed_name = "#{style}-#{icon_name}.svg"
      output_path = File.join('icons', 'box_icons', prefixed_name.gsub(/-+/, '-'))

      { icon_name: prefixed_name, output_path: output_path }
    end
  end
end
