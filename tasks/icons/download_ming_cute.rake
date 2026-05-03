# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # MingCute icons are released under the Apache License Version 2.0
  # License: https://github.com/Richard9394/MingCute/blob/main/LICENSE
  #
  # MingCute ships SVGs under svg/<category>/<name>_line.svg and
  # svg/<category>/<name>_fill.svg in the Richard9394/MingCute repo. The
  # archive extracts to "mingcute-icons-main/" (not "MingCute-main/"). We
  # flatten the category out of the filename and hyphenate underscores in
  # the icon name while preserving the trailing "_line" / "_fill" variant
  # suffix, e.g. svg/arrow/arrow_up_line.svg becomes "arrow-up_line.svg",
  # so consumers call `mingcute_icon('arrow-up_line')`.
  desc 'Download MingCute icons from GitHub repository'
  task :download_ming_cute do
    puts 'Downloading MingCute icons to rubicons...'

    download_icon(
      {
        icon_path: 'ming_cute',
        zip_url:   'https://github.com/Richard9394/MingCute/archive/refs/heads/main.zip'
      }
    ) do |entry|
      # Match: mingcute-icons-main/svg/<category>/<name>_<variant>.svg
      # where <variant> is "line" or "fill".
      next unless entry.name =~ %r{mingcute-icons-main/svg/[^/]+/([^/]+)_(line|fill)\.svg$}

      base    = Regexp.last_match(1)
      variant = Regexp.last_match(2)

      flat_name = "#{base.tr('_', '-')}_#{variant}.svg"
      output_path = File.join('icons', 'ming_cute', flat_name)

      { icon_name: flat_name, output_path: output_path }
    end
  end
end
