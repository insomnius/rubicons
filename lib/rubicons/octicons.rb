# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Octicons
    autoload :RailsHelper, 'rubicons/octicons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/octicons', __dir__)

    class << self
      def pack_name
        'Octicons'
      end

      def pack_description
        'Octicons are GitHub\'s open-source icon set, providing a clean and consistent way to add visual elements to your project with icons used across GitHub\'s interface.'
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
