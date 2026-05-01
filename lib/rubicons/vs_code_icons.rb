# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module VsCodeIcons
    autoload :RailsHelper, 'rubicons/vs_code_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/vs_code_icons', __dir__)

    class << self
      def pack_name
        'VS Code Icons'
      end

      def pack_description
        'VS Code Icons is a multi-color file and folder icon set used by the vscode-icons extension to bring rich, colorful file-type icons to Visual Studio Code.'
      end

      def license
        'MIT'
      end

      def icon(name, **options)
        BaseIconSet.render_icon(name, ICONS_PATH, self, **options)
      end

      def icon!(name, **options)
        BaseIconSet.render_icon!(name, ICONS_PATH, self, **options)
      end

      def available_icons
        @available_icons ||= BaseIconSet.available_icons(ICONS_PATH)
      end

      # Multi-color icons: preserve the original SVG colors. Returning nil here
      # signals to BaseIconSet that no override stroke/fill should be applied.
      # NOTE: Nokogiri's Element#[]= coerces nil via to_s, producing an
      # empty-string attribute instead of removing it — see summary.
      def fill_color
        nil
      end

      def stroke_color
        nil
      end
    end
  end
end
