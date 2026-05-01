# frozen_string_literal: true

module Rubicons
  module CssGg
    # Rails view helper for css.gg icons
    module RailsHelper
      def css_gg_icon(name, options = {})
        Rubicons::CssGg.icon(name, **options).html_safe
      end

      def css_gg_icon!(name, options = {})
        Rubicons::CssGg.icon!(name, **options).html_safe
      end
    end
  end
end
