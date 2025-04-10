# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Ionicons5
    autoload :RailsHelper, 'rubicons/ionicons5/rails_helper'

    extend BaseIconSet

    SIZE_MAP = BaseIconSet::DEFAULT_SIZE_MAP.freeze
    ICONS_PATH = File.expand_path('../../icons/ionicons5', __dir__)

    class << self
      def icon(name, **options)
        render_icon(name, ICONS_PATH, **options)
      end

      def icon!(name, **options)
        render_icon!(name, ICONS_PATH, **options)
      end

      def available_icons
        available_icons(ICONS_PATH)
      end
    end
  end
end
