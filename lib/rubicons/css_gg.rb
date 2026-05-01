# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module CssGg
    autoload :RailsHelper, 'rubicons/css_gg/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/css_gg', __dir__)

    class << self
      def pack_name
        'css.gg'
      end

      def pack_description
        'css.gg is a set of pure CSS, open-source icons available as SVG, with 700+ minimal, consistent icons designed by Astrit.'
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
