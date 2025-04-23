# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Typicons are released under the SIL Open Font License
  # License: https://github.com/stephenhutchings/typicons.font/blob/master/README.md#license
  desc 'Download Typicons from GitHub repository'
  task :download_typicons do
    puts 'Downloading Typicons to rubicons...'

    download_icon(
      {
        icon_path: 'typicons',
        zip_url:   'https://github.com/stephenhutchings/typicons.font/archive/v2.1.2.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{typicons\.font-2\.1\.2/src/svg/(.+\.svg)$}

      icon_name = Regexp.last_match(1)
      output_path = File.join('icons', 'typicons', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
