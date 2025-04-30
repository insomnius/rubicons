# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Heroicons2
    autoload :RailsHelper, 'rubicons/heroicons2/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/heroicons2', __dir__)

    class << self
      def pack_name
        'Heroicons v2'
      end

      def pack_description
        'Heroicons v2 is the latest version of the beautiful hand-crafted SVG icons from the makers of Tailwind CSS, with solid and outline variants in multiple sizes.'
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
