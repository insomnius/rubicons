# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module WeatherIcons
    autoload :RailsHelper, 'rubicons/weather_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/weather_icons', __dir__)

    class << self
      def pack_name
        'Weather Icons'
      end

      def pack_description
        'Weather Icons is a comprehensive collection of weather-themed icons designed for meteorological and forecast applications, featuring hundreds of detailed climate and weather symbols.'
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
        @available_icons ||= BaseIconSet.available_icons(ICONS_PATH)
      end
    end
  end
end
