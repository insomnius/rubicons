# frozen_string_literal: true

module Rubicons
  module FontAwesome6
    # Rails view helper for Font Awesome 6 icons
    module RailsHelper
      def fa6_icon(name, options = {})
        Rubicons::FontAwesome6.icon(name, **options).html_safe
      end

      def fa6_icon!(name, options = {})
        Rubicons::FontAwesome6.icon!(name, **options).html_safe
      end
    end
  end
end
