# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # IcoMoon Free icons are released under the CC BY 4.0 License
  # License: https://github.com/Keyamoon/IcoMoon-Free/blob/master/License.txt
  #
  # Source repository: https://github.com/Keyamoon/IcoMoon-Free
  #
  # Note: the master archive of IcoMoon-Free ships individual SVG files in the
  # top-level `SVG/` directory, named like `001-home.svg`, `002-home2.svg`,
  # `003-home3.svg`, etc. The numeric prefix encodes the icon's position in
  # the original IcoMoon-Free.json manifest (which also lives at the repo root
  # and lists each icon's name, tags, and codepoint). We keep the numeric
  # prefix on disk so filenames remain stable across upstream re-orderings;
  # callers reference icons via `Rubicons::IcoMoon.icon('001-home')`.
  desc 'Download IcoMoon Free icons from GitHub repository'
  task :download_ico_moon do
    puts 'Downloading IcoMoon Free icons to rubicons...'

    download_icon(
      {
        icon_path: 'ico_moon',
        zip_url:   'https://github.com/Keyamoon/IcoMoon-Free/archive/refs/heads/master.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{IcoMoon-Free-master/SVG/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'ico_moon', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
