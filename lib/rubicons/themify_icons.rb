# frozen_string_literal: true

module Rubicons
  module ThemifyIcons
    autoload :RailsHelper, 'rubicons/themify_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/themify', __dir__)

    class << self
      def pack_name
        'Themify Icons'
      end

      def description
        'Themify Icons is a complete set of icons for use in web design and apps, consisting of 320+ pixel-perfect, hand-crafted icons that are suitable for various projects.'
      end

      def license
        'SIL OFL 1.1'
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
