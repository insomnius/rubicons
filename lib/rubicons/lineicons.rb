# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Lineicons
    autoload :RailsHelper, 'rubicons/lineicons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/lineicons', __dir__)

    class << self
      def pack_name
        'Lineicons'
      end

      def pack_description
        'Lineicons is a collection of 600+ free, MIT-licensed line-style icons for designers and developers, by LineiconsHQ. Only the free regular set is bundled here.'
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

      # Lineicons SVGs ship with `fill="none"` on the root and a hardcoded
      # `fill="#323544"` on each <path>. Returning nil tells BaseIconSet to
      # leave both attributes alone on the root element so the upstream
      # rendering is preserved. As a result these icons do NOT respond to
      # `currentColor` out of the box — pass `fill: 'currentColor'` via
      # options if you want them to inherit text color (this still won't
      # override the per-path hardcoded color without further processing).
      def fill_color
        nil
      end

      def stroke_color
        nil
      end
    end
  end
end
