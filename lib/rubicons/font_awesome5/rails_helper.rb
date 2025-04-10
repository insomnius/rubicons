# frozen_string_literal: true

module Rubicons
  module FontAwesome5
    # Rails view helper for Font Awesome 5 icons
    module RailsHelper
      def fa5_icon(name, options = {})
        Rubicons::FontAwesome5.icon(name, **options).html_safe
      end

      def fa5_icon!(name, options = {})
        Rubicons::FontAwesome5.icon!(name, **options).html_safe
      end
    end
  end
end
