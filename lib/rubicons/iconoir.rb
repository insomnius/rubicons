# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Iconoir
    autoload :RailsHelper, 'rubicons/iconoir/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/iconoir', __dir__)

    class << self
      def pack_name
        'Iconoir'
      end

      def pack_description
        'Iconoir is a high-quality, open-source library of SVG icons featuring a consistent stroke-based design with both regular (outline) and solid variants.'
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
        'none'
      end

      def stroke_color
        'currentColor'
      end
    end
  end
end
