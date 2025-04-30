# frozen_string_literal: true

require 'nokogiri'

module Rubicons
  module Lucide
    autoload :RailsHelper, 'rubicons/lucide/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/lucide', __dir__)

    class << self
      def pack_name
        'Lucide'
      end

      def pack_description
        'Lucide is a beautiful and consistent icon toolkit made by the community. It is a fork of Feather Icons with hundreds of additional icons and active community development.'
      end

      def license
        'ISC'
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
