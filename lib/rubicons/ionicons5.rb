# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Ionicons5
    autoload :RailsHelper, 'rubicons/ionicons5/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/ionicons5', __dir__)

    class << self
      def pack_name
        'Ionicons 5'
      end

      def pack_description
        'Ionicons 5 is the latest version of the icon pack for Ionic Framework applications with beautifully crafted icons optimized for web, iOS, and Material Design.'
      end

      def license
        'MIT'
      end

      def icon(name, **options)
        BaseIconSet.render_icon(name, ICONS_PATH, **options)
      end

      def icon!(name, **options)
        BaseIconSet.render_icon!(name, ICONS_PATH, **options)
      end

      def available_icons
        @available_icons ||= BaseIconSet.available_icons(ICONS_PATH)
      end
    end
  end
end
