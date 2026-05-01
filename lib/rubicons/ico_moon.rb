# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module IcoMoon
    autoload :RailsHelper, 'rubicons/ico_moon/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/ico_moon', __dir__)

    class << self
      def pack_name
        'IcoMoon Free'
      end

      def pack_description
        'IcoMoon Free is a pack of 491 free vector icons released by IcoMoon under the CC BY 4.0 license. The icons are designed on a 16x16 grid and ship as solid, fill-based glyphs.'
      end

      def license
        'CC BY 4.0'
      end

      def icon(name, **options)
        BaseIconSet.render_icon(name, ICONS_PATH, self, **options)
      end

      def icon!(name, **options)
        BaseIconSet.render_icon!(name, ICONS_PATH, self, **options)
      end

      def fill_color
        'currentColor'
      end

      def stroke_color
        'none'
      end

      def available_icons
        @available_icons ||= BaseIconSet.available_icons(ICONS_PATH)
      end
    end
  end
end
