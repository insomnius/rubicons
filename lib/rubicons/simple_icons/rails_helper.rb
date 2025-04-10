# frozen_string_literal: true

module Rubicons
  module SimpleIcons
    # Rails view helper for Simple Icons
    module RailsHelper
      def simple_icon(name, options = {})
        Rubicons::SimpleIcons.icon(name, **options).html_safe
      end

      def simple_icon!(name, options = {})
        Rubicons::SimpleIcons.icon!(name, **options).html_safe
      end
    end
  end
end
