# frozen_string_literal: true

module Rubicons
  module Iconoir
    # Rails view helper for Iconoir icons
    module RailsHelper
      def iconoir_icon(name, options = {})
        Rubicons::Iconoir.icon(name, **options).html_safe
      end

      def iconoir_icon!(name, options = {})
        Rubicons::Iconoir.icon!(name, **options).html_safe
      end
    end
  end
end
