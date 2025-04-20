# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module SimpleIcons
    autoload :RailsHelper, 'rubicons/simple_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/simple_icons', __dir__)

    class << self
      def pack_name
        'Simple Icons'
      end

      def description
        'Simple Icons is a collection of SVG icons for popular brands and services, perfect for use in projects that require recognizable logos and brand marks.'
      end

      def license
        'CC0 1.0'
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
