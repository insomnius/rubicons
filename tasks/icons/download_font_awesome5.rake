# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Font Awesome 5 icons are released under multiple licenses:
  # - Icons: CC BY 4.0 License
  # - Fonts: SIL OFL 1.1 License
  # - Code: MIT License
  # License: https://github.com/FortAwesome/Font-Awesome/blob/5.x/LICENSE.txt
  desc 'Download Font Awesome 5 icons from GitHub repository'
  task :download_font_awesome5 do
    puts 'Downloading Font Awesome 5 icons to rubicons...'

    download_icon(
      {
        icon_path: 'font_awesome5',
        zip_url:   'https://github.com/FortAwesome/Font-Awesome/archive/5.15.4.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{Font-Awesome-5\.15\.4/svgs/(solid|regular|brands)/(.+\.svg)$}

      style = Regexp.last_match(1)
      icon_name = Regexp.last_match(2)
      # Prefix icon name with style to avoid conflicts
      prefixed_name = "#{style}-#{icon_name}"
      output_path = File.join('icons', 'font_awesome5', prefixed_name)

      { icon_name: prefixed_name, output_path: output_path }
    end
  end
end
