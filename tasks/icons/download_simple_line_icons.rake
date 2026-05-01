# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Simple Line Icons are released under the MIT License
  # License: https://github.com/thesabbir/simple-line-icons/blob/master/LICENSE.md
  #
  # NOTE: Simple Line Icons was originally distributed as an icon font
  # (Simple-Line-Icons.{eot,ttf,woff,woff2,svg} under `fonts/`). Individual
  # SVG sources for each glyph DO live upstream at `src/svgs/*.svg` on the
  # master branch, so we extract those directly. If that folder ever
  # disappears, an alternative is to extract glyphs from the SVG font
  # (`fonts/Simple-Line-Icons.svg`) using a tool like fontTools / fonteditor
  # and emit one `<svg>` per `<glyph>` — but that fallback is not needed today.
  desc 'Download Simple Line Icons from GitHub repository'
  task :download_simple_line_icons do
    puts 'Downloading Simple Line Icons to rubicons...'

    download_icon(
      {
        icon_path: 'simple_line_icons',
        zip_url:   'https://github.com/thesabbir/simple-line-icons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{simple-line-icons-master/src/svgs/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'simple_line_icons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
