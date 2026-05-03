# frozen_string_literal: true

require_relative './common'

namespace :icons do
  # Material Symbols icons are released under the Apache License Version 2.0
  # License: https://github.com/google/material-design-icons/blob/master/LICENSE
  #
  # Material Symbols are the newer (post-2021) evolution of Material Design Icons.
  # They live under symbols/web/<name>/<style>/<name>_<weight>.svg in the
  # google/material-design-icons repo. We only pull the default weight (wght400,
  # no fill) for the three styles: outlined, rounded, sharp. Filenames are
  # flattened to "<style>-<name>.svg" (e.g. "outlined-home.svg").
  desc 'Download Material Symbols icons from GitHub repository'
  task :download_material_symbols do
    puts 'Downloading Material Symbols icons to rubicons...'

    style_dirs = {
      'materialsymbolsoutlined' => 'outlined',
      'materialsymbolsrounded'  => 'rounded',
      'materialsymbolssharp'    => 'sharp'
    }.freeze

    download_icon(
      {
        icon_path: 'material_symbols',
        zip_url:   'https://github.com/google/material-design-icons/archive/refs/heads/master.zip'
      }
    ) do |entry|
      # Match: material-design-icons-master/symbols/web/<icon>/<style>/<icon>_24px.svg
      # We deliberately exclude any path containing "wght" or "fill" — those are
      # the non-default weight/fill variants which we don't ship.
      next unless entry.name =~ %r{material-design-icons-master/symbols/web/([^/]+)/([^/]+)/\1_24px\.svg$}

      icon_base = Regexp.last_match(1)
      style_dir = Regexp.last_match(2)

      style = style_dirs[style_dir]
      next unless style

      flat_name = "#{style}-#{icon_base.tr('_', '-')}.svg"
      output_path = File.join('icons', 'material_symbols', flat_name)

      { icon_name: flat_name, output_path: output_path }
    end
  end
end
