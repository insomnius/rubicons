# frozen_string_literal: true

module Rubicons
  module CarbonIcons
    # Rails view helper for Carbon Icons
    module RailsHelper
      def carbon_icon(name, options = {})
        Rubicons::CarbonIcons.icon(name, **options).html_safe
      end

      def carbon_icon!(name, options = {})
        Rubicons::CarbonIcons.icon!(name, **options).html_safe
      end
    end
  end
end
