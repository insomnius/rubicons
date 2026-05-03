# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Majesticons
    autoload :RailsHelper, 'rubicons/majesticons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/majesticons', __dir__)

    class << self
      def pack_name
        'Majesticons'
      end

      def pack_description
        'Majesticons is a versatile, beautiful, and scalable iconset by Gerrit Halfmann. The free version offers 760 icons in paired line and solid styles, all built on a 24x24 grid.'
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

      # Majesticons SVGs already carry the correct fill/stroke on each path
      # (line variants use stroke="currentColor"; solid variants use fill="currentColor").
      # The root <svg> ships with fill="none", which is required so that line
      # variants don't get filled. We keep that fill="none" and leave stroke
      # untouched (returning nil deletes the attribute, preserving per-path strokes).
      def fill_color
        'none'
      end

      def stroke_color
        nil
      end
    end
  end
end
