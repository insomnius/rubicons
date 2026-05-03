# frozen_string_literal: true

module Rubicons
  module FluentUiIcons
    # Rails view helper for Fluent UI System Icons
    module RailsHelper
      def fluent_ui_icon(name, options = {})
        Rubicons::FluentUiIcons.icon(name, **options).html_safe
      end

      def fluent_ui_icon!(name, options = {})
        Rubicons::FluentUiIcons.icon!(name, **options).html_safe
      end
    end
  end
end
