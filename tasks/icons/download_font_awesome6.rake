# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Font Awesome 6 icons are released under multiple licenses:
  # - Icons: CC BY 4.0 License
  # - Fonts: SIL OFL 1.1 License
  # - Code: MIT License
  # License: https://github.com/FortAwesome/Font-Awesome/blob/6.x/LICENSE.txt
  desc 'Download Font Awesome 6 icons from GitHub repository'
  task :download_font_awesome6 do
    puts 'Downloading Font Awesome 6 icons to rubicons...'

    download_icon(
      {
        icon_path: 'font_awesome6',
        zip_url:   'https://github.com/FortAwesome/Font-Awesome/archive/6.5.2.zip'
      }
    ) do |entry|
      # Match all icon styles
      next unless entry.name =~ %r{Font-Awesome-6\.5\.2/svgs/(solid|regular|brands|thin|light|duotone)/(.+\.svg)$}

      style = Regexp.last_match(1)
      icon_name = Regexp.last_match(2)
      # Prefix icon name with style to avoid conflicts
      prefixed_name = "#{style}-#{icon_name}"
      output_path = File.join('icons', 'font_awesome6', prefixed_name)

      { icon_name: prefixed_name, output_path: output_path }
    end
  end
end
