# frozen_string_literal: true

module Rubicons
  module Pixelarticons
    # Rails view helper for Pixelarticons icons
    module RailsHelper
      def pixelarticons_icon(name, options = {})
        Rubicons::Pixelarticons.icon(name, **options).html_safe
      end

      def pixelarticons_icon!(name, options = {})
        Rubicons::Pixelarticons.icon!(name, **options).html_safe
      end
    end
  end
end
