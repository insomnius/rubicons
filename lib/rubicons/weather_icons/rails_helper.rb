# frozen_string_literal: true

module Rubicons
  module WeatherIcons
    # Rails view helper for Weather Icons
    module RailsHelper
      def weather_icon(name, options = {})
        Rubicons::WeatherIcons.icon(name, **options).html_safe
      end
    end
  end
end
