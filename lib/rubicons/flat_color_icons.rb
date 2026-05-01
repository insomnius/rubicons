# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module FlatColorIcons
    autoload :RailsHelper, 'rubicons/flat_color_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/flat_color_icons', __dir__)

    class << self
      def pack_name
        'Flat Color Icons'
      end

      def pack_description
        'Flat Color Icons is a free, open source icon set by Icons8 featuring vibrant, multi-color flat-style icons for use in web and mobile applications.'
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

      # Multi-color brand-mark icons: preserve original SVG stroke/fill.
      # NOTE: BaseIconSet.render_icon assigns these unconditionally to the
      # <svg> root, so nil values will be coerced by Nokogiri to empty
      # strings (stroke="" fill=""). See README/summary for details.
      def fill_color
        nil
      end

      def stroke_color
        nil
      end
    end
  end
end
