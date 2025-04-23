# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module BoxIcons
    autoload :RailsHelper, 'rubicons/box_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/box_icons', __dir__)

    class << self
      def pack_name
        'Box Icons'
      end

      def pack_description
        'Box Icons is a free collection of carefully crafted open source icons. Each icon is designed on a 24x24 grid with an emphasis on simplicity, consistency and readability.'
      end

      def license
        'MIT/CC 4.0'
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
