# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module CircumIcons
    autoload :RailsHelper, 'rubicons/circum_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/circum_icons', __dir__)

    class << self
      def pack_name
        'Circum Icons'
      end

      def pack_description
        'Circum Icons is a clean and consistent open-source icon library with a focus on circular design elements for modern interfaces.'
      end

      def license
        'MPL-2.0'
      end

      def icon(name, **options)
        BaseIconSet.render_icon(name, ICONS_PATH, **options)
      end

      def icon!(name, **options)
        BaseIconSet.render_icon!(name, ICONS_PATH, **options)
      end

      def available_icons
        @available_icons ||= BaseIconSet.available_icons(ICONS_PATH)
      end
    end
  end
end
