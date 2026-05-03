# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module MaterialSymbols
    autoload :RailsHelper, 'rubicons/material_symbols/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/material_symbols', __dir__)

    class << self
      def pack_name
        'Material Symbols'
      end

      def pack_description
        'Material Symbols are the newer evolution of Material Design Icons by Google, providing a unified, variable-font-based icon system in Outlined, Rounded, and Sharp styles.'
      end

      def license
        'Apache 2.0'
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

      def fill_color
        'currentColor'
      end

      def stroke_color
        'none'
      end
    end
  end
end
