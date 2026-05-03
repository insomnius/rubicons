# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module MynaUiIcons
    autoload :RailsHelper, 'rubicons/myna_ui_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/myna_ui_icons', __dir__)

    class << self
      def pack_name
        'MynaUI Icons'
      end

      def pack_description
        'MynaUI Icons is a beautifully crafted, free and open-source icon library with 2,500+ icons. Tailwind and shadcn/ui aligned, monochrome stroke style.'
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

      def fill_color
        'none'
      end

      def stroke_color
        'currentColor'
      end
    end
  end
end
