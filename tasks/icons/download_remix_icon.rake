# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Remix Icon is released under the Apache License 2.0
  # License: https://github.com/Remix-Design/RemixIcon/blob/master/License
  desc 'Download Remix Icons from GitHub repository'
  task :download_remix_icon do
    puts 'Downloading Remix Icons to rubicons...'

    download_icon(
      {
        icon_path: 'remix_icon',
        zip_url:   'https://github.com/Remix-Design/RemixIcon/archive/refs/tags/v4.2.0.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{RemixIcon-4\.2\.0/icons/(.+)/(.+)\.svg$}

      icon_name = Regexp.last_match(2)
      prefixed_name = "#{icon_name}.svg"
      output_path = File.join('icons', 'remix_icon', prefixed_name)

      { icon_name: prefixed_name, output_path: output_path }
    end
  end
end
