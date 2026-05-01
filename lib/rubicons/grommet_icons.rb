# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module GrommetIcons
    autoload :RailsHelper, 'rubicons/grommet_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/grommet_icons', __dir__)

    class << self
      def pack_name
        'Grommet Icons'
      end

      def pack_description
        'Grommet Icons is a collection of clean, modern SVG icons designed for the Grommet design system.'
      end

      def license
        'Apache 2.0'
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
        'none'
      end

      def stroke_color
        'currentColor'
      end
    end
  end
end
