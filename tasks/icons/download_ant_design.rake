# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Ant Design Icons are released under the MIT License
  # License: https://github.com/ant-design/ant-design-icons/blob/master/LICENSE
  desc 'Download Ant Design icons from GitHub repository'
  task :download_ant_design do
    puts 'Downloading Ant Design icons to rubicons...'

    download_icon(
      {
        icon_path: 'ant_design',
        zip_url:   'https://github.com/ant-design/ant-design-icons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      next unless entry.name =~ %r{ant-design-icons-master/packages/icons-svg/svg/(filled|outlined|twotone)/(.+\.svg)$}

      theme = Regexp.last_match(1)
      base_name = Regexp.last_match(2)
      icon_name = "#{theme}-#{base_name}"
      output_path = File.join('icons', 'ant_design', icon_name)

      { icon_name: icon_name, output_path: output_path }
    end
  end
end
