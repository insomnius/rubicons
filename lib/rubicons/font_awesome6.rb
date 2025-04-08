# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module FontAwesome6
    autoload :RailsHelper, 'rubicons/font_awesome6/rails_helper'

    extend BaseIconSet

    SIZE_MAP = BaseIconSet::DEFAULT_SIZE_MAP.freeze
    ICONS_PATH = File.expand_path('../../icons/font_awesome6', __dir__)

    class << self
      def icon(name, **options)
        render_icon(name, ICONS_PATH, **options)
      end

      def available_icons
        available_icons(ICONS_PATH)
      end
    end
  end
end
