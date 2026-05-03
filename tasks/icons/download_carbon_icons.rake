# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Carbon Icons are released under the Apache License 2.0
  # License: https://github.com/carbon-design-system/carbon/blob/main/LICENSE
  # Copyright 2015 IBM Corp.
  desc 'Download Carbon Icons from GitHub repository'
  task :download_carbon_icons do
    puts 'Downloading Carbon Icons to rubicons...'

    download_icon(
      {
        icon_path: 'carbon_icons',
        zip_url:   'https://github.com/carbon-design-system/carbon/archive/refs/heads/main.zip'
      }
    ) do |entry|
      # Take size 32 SVGs (the canonical full set — sizes 16/20/24 are subsets).
      # Strip the size dir from the output filename so consumers say `carbon_icon('home')`.
      next unless entry.name =~ %r{carbon-main/packages/icons/src/svg/32/(.+\.svg)$}

      # Carbon's size-32 dir has nested subdirs (e.g. Q/H.svg); flatten with '-'
      icon_name = Regexp.last_match(1).tr('/', '-')
      output_path = File.join('icons', 'carbon_icons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
