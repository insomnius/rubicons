# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Weather Icons are released under the SIL OFL 1.1 License
  # License: https://github.com/erikflowers/weather-icons/blob/master/README.md#licensing
  desc 'Download Weather Icons from GitHub repository'
  task :download_weather_icons do
    puts 'Downloading Weather Icons to rubicons...'

    download_icon(
      {
        icon_path: 'weather_icons',
        zip_url:   'https://github.com/erikflowers/weather-icons/archive/refs/tags/2.0.12.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{weather-icons-2\.0\.12/svg/(.+)\.svg$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'weather_icons', "#{icon_name}.svg")

      { icon_name: "#{icon_name}.svg", output_path: output_path }
    end
  end
end
