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
