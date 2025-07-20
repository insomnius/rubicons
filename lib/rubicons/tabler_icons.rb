# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module TablerIcons
    autoload :RailsHelper, 'rubicons/tabler_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/tabler_icons', __dir__)

    class << self
      def pack_name
        'Tabler Icons'
      end

      def pack_description
        'Tabler Icons is a set of over 1,950 free MIT-licensed high-quality SVG icons for web design with a consistent style and optimized for clarity even at small sizes.'
      end

      def license
        'MIT'
      end

      def icon(name, **options)
        BaseIconSet.render_icon(name, ICONS_PATH, self, **options) do |svg_element|
          if name.to_s.include?('filled')
            svg_element['fill'] = 'currentColor'
            svg_element['stroke'] = 'none'
          end
        end
      end

      def icon!(name, **options)
        BaseIconSet.render_icon!(name, ICONS_PATH, self, **options) do |svg_element|
          if name.to_s.include?('filled')
            svg_element['fill'] = 'currentColor'
            svg_element['stroke'] = 'none'
          end
        end
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
