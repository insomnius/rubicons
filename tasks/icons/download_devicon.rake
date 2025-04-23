# frozen_string_literal: true

require_relative './common'

namespace :icons do
  desc 'Download Devicon from GitHub repository'
  task :download_devicon do
    puts 'Downloading Devicon to rubicons...'

    download_icon(
      {
        icon_path: 'devicon',
        zip_url:   'https://github.com/devicons/devicon/archive/refs/tags/v2.16.0.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{devicon-2\.16\.0/icons/.+/(.+)\.svg}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'devicon', "#{icon_name}.svg")

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
