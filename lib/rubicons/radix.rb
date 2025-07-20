# frozen_string_literal: true

require 'nokogiri'

module Rubicons
  module Radix
    autoload :RailsHelper, 'rubicons/radix/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/radix', __dir__)

    class << self
      def pack_name
        'Radix UI Icons'
      end

      def pack_description
        'Radix UI Icons is a crisp set of icons designed by the Radix UI team, primarily for use with Radix UI components and modern web applications.'
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
