# frozen_string_literal: true

module Rubicons
  module CircumIcons
    # Rails view helper for CircumIcons
    module RailsHelper
      def circum_icon(name, options = {})
        Rubicons::CircumIcons.icon(name, **options).html_safe
      end
    end
  end
end
