# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Pixelarticons
    autoload :RailsHelper, 'rubicons/pixelarticons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/pixelarticons', __dir__)

    class << self
      def pack_name
        'Pixelarticons'
      end

      def pack_description
        'Pixelarticons is a set of beautiful pixel-art monochrome icons designed on a 24x24 grid, perfect for retro and pixel-style interfaces.'
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

      def fill_color
        'currentColor'
      end

      def stroke_color
        'none'
      end
    end
  end
end
