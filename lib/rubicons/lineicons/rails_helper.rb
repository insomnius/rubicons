# frozen_string_literal: true

module Rubicons
  module Lineicons
    # Rails view helper for Lineicons icons
    module RailsHelper
      def lineicons_icon(name, options = {})
        Rubicons::Lineicons.icon(name, **options).html_safe
      end

      def lineicons_icon!(name, options = {})
        Rubicons::Lineicons.icon!(name, **options).html_safe
      end
    end
  end
end
