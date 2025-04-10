# frozen_string_literal: true

module Rubicons
  module MaterialDesign
    # Rails view helper for Material Design icons
    module RailsHelper
      def md_icon(name, options = {})
        Rubicons::MaterialDesign.icon(name, **options).html_safe
      end

      def md_icon!(name, options = {})
        Rubicons::MaterialDesign.icon!(name, **options).html_safe
      end
    end
  end
end
