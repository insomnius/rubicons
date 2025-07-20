# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Heroicons
    autoload :RailsHelper, 'rubicons/heroicons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/heroicons', __dir__)

    class << self
      def pack_name
        'Heroicons v1'
      end

      def pack_description
        'Heroicons v1 is a set of free, MIT-licensed high-quality SVG icons for UI development, designed by the makers of Tailwind CSS.'
      end

      def license
        'MIT'
      end

      def icon(name, **options)
        BaseIconSet.render_icon(name, ICONS_PATH, self, **options) do |svg_element|
          svg_element.css('path').each { |path| path['stroke'] = 'currentColor' } if name.to_s.include?('outline')
          svg_element.css('path').each { |path| path['fill'] = 'currentColor' } if name.to_s.include?('solid')
        end
      end

      def icon!(name, **options)
        BaseIconSet.render_icon!(name, ICONS_PATH, self, **options) do |svg_element|
          svg_element.css('path').each { |path| path['stroke'] = 'currentColor' } if name.to_s.include?('outline')
          svg_element.css('path').each { |path| path['fill'] = 'currentColor' } if name.to_s.include?('solid')
        end
      end

      def available_icons
        @available_icons ||= BaseIconSet.available_icons(ICONS_PATH)
      end

      def fill_color
        'none'
      end

      def stroke_color
        'none'
      end
    end
  end
end
