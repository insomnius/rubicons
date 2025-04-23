# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Octicons are released under the MIT License
  # License: https://github.com/primer/octicons/blob/main/LICENSE
  desc 'Download GitHub Octicons from GitHub repository'
  task :download_octicons do
    puts 'Downloading GitHub Octicons to rubicons...'

    download_icon(
      {
        icon_path: 'octicons',
        zip_url:   'https://github.com/primer/octicons/archive/v18.3.0.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{octicons-18\.3\.0/icons/(.+)\.svg$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'octicons', "#{icon_name}.svg")

      { icon_name: "#{icon_name}.svg", output_path: output_path }
    end
  end
end
