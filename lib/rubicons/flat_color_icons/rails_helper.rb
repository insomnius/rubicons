# frozen_string_literal: true

module Rubicons
  module FlatColorIcons
    # Rails view helper for Flat Color Icons
    module RailsHelper
      def flat_color_icon(name, options = {})
        Rubicons::FlatColorIcons.icon(name, **options).html_safe
      end

      def flat_color_icon!(name, options = {})
        Rubicons::FlatColorIcons.icon!(name, **options).html_safe
      end
    end
  end
end
