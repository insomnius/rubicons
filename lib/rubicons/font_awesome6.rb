# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module FontAwesome6
    autoload :RailsHelper, 'rubicons/font_awesome6/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/font_awesome6', __dir__)

    class << self
      def pack_name
        'Font Awesome 6'
      end

      def description
        'Font Awesome 6 is the latest version of the popular icon library with thousands of icons for web, mobile, and desktop applications across various styles and categories.'
      end

      def license
        'Multiple'
      end

      def icon(name, **options)
        BaseIconSet.render_icon(name, ICONS_PATH, **options)
      end

      def icon!(name, **options)
        BaseIconSet.render_icon!(name, ICONS_PATH, **options)
      end

      def available_icons
        BaseIconSet.available_icons(ICONS_PATH)
      end
    end
  end
end
