# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Game Icons are released under the Creative Commons Attribution 3.0 Unported (CC BY 3.0) License
  # License: https://creativecommons.org/licenses/by/3.0/
  # Source:  https://github.com/game-icons/icons
  #
  # Upstream layout: <author>/originals/svg/000000/transparent/<name>.svg
  # We flatten authors into the filename as `<author>-<name>.svg` so every author's
  # contributions live side-by-side in `icons/game_icons/` without sub-directories.
  desc 'Download Game Icons from GitHub repository'
  task :download_game_icons do
    puts 'Downloading Game Icons to rubicons...'

    download_icon(
      {
        icon_path: 'game_icons',
        zip_url:   'https://github.com/game-icons/icons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      # Strip the top-level `icons-master/` folder that GitHub archives add.
      stripped = entry.name.sub(%r{\Aicons-master/}, '')
      next unless stripped =~ %r{^[^/]+/[^/]+/originals/svg/000000/transparent/(.+\.svg)$}

      # Re-match against the stripped path to capture author + remaining path.
      stripped =~ %r{^(?<author>[^/]+)/(?<_pack>[^/]+)/originals/svg/000000/transparent/(?<rest>.+\.svg)$}
      author = Regexp.last_match(:author)
      rest   = Regexp.last_match(:rest)

      # Preserve any nested directory structure inside the filename by replacing
      # path separators with `-`, prefixed with the author so authors are namespaced.
      flat_name = "#{author}-#{rest.tr('/', '-')}"

      output_path = File.join('icons', 'game_icons', flat_name)

      { icon_name: flat_name, output_path: output_path }
    end
  end
end
