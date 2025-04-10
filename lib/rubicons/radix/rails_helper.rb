# frozen_string_literal: true

module Rubicons
  module Radix
    # Rails view helper for Radix icons
    module RailsHelper
      def radix_icon(name, options = {})
        Rubicons::Radix.icon(name, **options).html_safe
      end

      def radix_icon!(name, options = {})
        Rubicons::Radix.icon!(name, **options).html_safe
      end
    end
  end
end
