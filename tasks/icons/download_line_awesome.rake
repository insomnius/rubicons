# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Line Awesome is released under either MIT License or the "Good Boy License"
  # License: https://github.com/icons8/line-awesome/blob/master/LICENSE.md
  desc 'Download Line Awesome Icons from GitHub repository'
  task :download_line_awesome do
    puts 'Downloading Line Awesome Icons to rubicons...'

    download_icon(
      {
        icon_path: 'line_awesome',
        zip_url:   'https://github.com/icons8/line-awesome/archive/refs/heads/master.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{line-awesome-master/svg/(.+)\.svg$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'line_awesome', "#{icon_name}.svg")

      { icon_name: "#{icon_name}.svg", output_path: output_path }
    end
  end
end
