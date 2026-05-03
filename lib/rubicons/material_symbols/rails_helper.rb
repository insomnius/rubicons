# frozen_string_literal: true

module Rubicons
  module MaterialSymbols
    # Rails view helper for Material Symbols icons
    module RailsHelper
      def material_symbol_icon(name, options = {})
        Rubicons::MaterialSymbols.icon(name, **options).html_safe
      end

      def material_symbol_icon!(name, options = {})
        Rubicons::MaterialSymbols.icon!(name, **options).html_safe
      end
    end
  end
end
