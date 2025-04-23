# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Material Design icons are released under the Apache License Version 2.0
  # License: https://github.com/google/material-design-icons/blob/master/LICENSE
  desc 'Download Material Design Icons from GitHub repository'
  task :download_material_design do
    puts 'Downloading Material Design Icons to rubicons...'

    download_icon(
      {
        icon_path: 'material_design',
        zip_url:   'https://github.com/google/material-design-icons/archive/refs/tags/4.0.0.zip'
      }
    ) do |entry|
      # Match SVG files in the svg/*/24px.svg pattern
      next unless entry.name =~ %r{material-design-icons-4\.0\.0/src/(.+)/24px\.svg}

      icon_name = Regexp.last_match(1).split('/').join('-').gsub('_', '-').gsub('materialicons', '').gsub('-.', '.')
      prefixed_name = "#{icon_name}.svg"
      output_path = File.join('icons', 'material_design', prefixed_name)

      { icon_name: prefixed_name, output_path: output_path }
    end
  end
end
