# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Ionicons4
    autoload :RailsHelper, 'rubicons/ionicons4/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/ionicons4', __dir__)

    class << self
      def pack_name
        'Ionicons 4'
      end

      def description
        'Ionicons 4 is a premium icon library for Ionic Framework with iOS, Material Design, and outline versions of commonly used icons.'
      end

      def license
        'MIT'
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
