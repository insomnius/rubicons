# frozen_string_literal: true

module Rubicons
  module MynaUiIcons
    # Rails view helper for MynaUI icons
    module RailsHelper
      def myna_ui_icon(name, options = {})
        Rubicons::MynaUiIcons.icon(name, **options).html_safe
      end

      def myna_ui_icon!(name, options = {})
        Rubicons::MynaUiIcons.icon!(name, **options).html_safe
      end
    end
  end
end
