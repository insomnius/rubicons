# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module MingCute
    autoload :RailsHelper, 'rubicons/ming_cute/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/ming_cute', __dir__)

    class << self
      def pack_name
        'MingCute'
      end

      def pack_description
        'MingCute is a beautiful and minimal Apache-2.0 licensed icon set with both line (stroke) and fill variants for every icon, designed to keep visual consistency across web, mobile, and print.'
      end

      def license
        'Apache-2.0'
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
