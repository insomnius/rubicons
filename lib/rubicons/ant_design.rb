# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module AntDesign
    autoload :RailsHelper, 'rubicons/ant_design/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/ant_design', __dir__)

    class << self
      def pack_name
        'Ant Design'
      end

      def pack_description
        'Ant Design Icons is the official icon library for Ant Design, a comprehensive design system. It provides high-quality SVG icons across filled, outlined, and twotone themes for use in web applications.'
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
