# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module SimpleLineIcons
    autoload :RailsHelper, 'rubicons/simple_line_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/simple_line_icons', __dir__)

    class << self
      def pack_name
        'Simple Line Icons'
      end

      def pack_description
        'Simple Line Icons is a set of clean, minimal line-style icons originally distributed as an icon font, by Sabbir Ahmed.'
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
