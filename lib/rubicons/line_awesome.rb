# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module LineAwesome
    autoload :RailsHelper, 'rubicons/line_awesome/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/line_awesome', __dir__)

    class << self
      def pack_name
        'Line Awesome'
      end

      def pack_description
        'Line Awesome is a free alternative to Font Awesome with over 1,500 icons that can be easily swapped between Font Awesome and Line Awesome.'
      end

      def license
        'MIT/Good Boy'
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
