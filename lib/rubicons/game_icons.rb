# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module GameIcons
    autoload :RailsHelper, 'rubicons/game_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/game_icons', __dir__)

    class << self
      def pack_name
        'Game Icons'
      end

      def pack_description
        'Game Icons is a community-driven collection of free SVG icons for game developers and designers, contributed by many authors. Files are namespaced by author (e.g. `lorc-sword`).'
      end

      def license
        'CC BY 3.0'
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
