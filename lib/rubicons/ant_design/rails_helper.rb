# frozen_string_literal: true

module Rubicons
  module AntDesign
    # Rails view helper for Ant Design icons
    module RailsHelper
      def ant_design_icon(name, options = {})
        Rubicons::AntDesign.icon(name, **options).html_safe
      end

      def ant_design_icon!(name, options = {})
        Rubicons::AntDesign.icon!(name, **options).html_safe
      end
    end
  end
end
