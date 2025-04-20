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

      def description
        'Heroicons v1 is a set of free, MIT-licensed high-quality SVG icons for UI development, designed by the makers of Tailwind CSS.'
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
        BaseIconSet.available_icons(ICONS_PATH)
      end
    end
  end
end
