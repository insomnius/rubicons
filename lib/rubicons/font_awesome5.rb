# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module FontAwesome5
    autoload :RailsHelper, 'rubicons/font_awesome5/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/font_awesome5', __dir__)

    class << self
      def pack_name
        'Font Awesome 5'
      end

      def pack_description
        'Font Awesome 5 is an icon set used by millions of designers, developers, and content creators with icons for web development, mobile apps, and desktop applications.'
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
