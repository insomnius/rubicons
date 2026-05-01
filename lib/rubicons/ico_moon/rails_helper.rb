# frozen_string_literal: true

module Rubicons
  module IcoMoon
    # Rails view helper for IcoMoon Free icons
    module RailsHelper
      def ico_moon_icon(name, options = {})
        Rubicons::IcoMoon.icon(name, **options).html_safe
      end

      def ico_moon_icon!(name, options = {})
        Rubicons::IcoMoon.icon!(name, **options).html_safe
      end
    end
  end
end
