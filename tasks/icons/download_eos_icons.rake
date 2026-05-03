# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # EOS Icons are released under the MIT License
  # License: https://github.com/EOS-uiux-Solutions/eos-icons/blob/master/LICENSE
  desc 'Download EOS Icons from GitHub repository'
  task :download_eos_icons do
    puts 'Downloading EOS Icons to rubicons...'

    download_icon(
      {
        icon_path: 'eos_icons',
        zip_url:   'https://github.com/EOS-uiux-Solutions/eos-icons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      case entry.name
      when %r{\Aeos-icons-master/svg/([^/]+\.svg)\z}
        icon_name = "filled-#{Regexp.last_match(1)}"
      when %r{\Aeos-icons-master/svg-outlined/([^/]+\.svg)\z}
        icon_name = "outlined-#{Regexp.last_match(1)}"
      else
        next
      end

      output_path = File.join('icons', 'eos_icons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
