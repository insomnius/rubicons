# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module CarbonIcons
    autoload :RailsHelper, 'rubicons/carbon_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/carbon_icons', __dir__)

    class << self
      def pack_name
        'Carbon Icons'
      end

      def pack_description
        'Carbon is IBM\'s open source design system for products and digital experiences. Carbon Icons are a comprehensive set of icons designed for use in Carbon Design System products.'
      end

      def license
        'Apache-2.0'
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
