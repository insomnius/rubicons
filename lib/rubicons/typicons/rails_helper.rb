# frozen_string_literal: true

module Rubicons
  module Typicons
    # Rails view helper for Typicons
    module RailsHelper
      def typicon(name, options = {})
        Rubicons::Typicons.icon(name, **options).html_safe
      end

      def typicon!(name, options = {})
        Rubicons::Typicons.icon!(name, **options).html_safe
      end
    end
  end
end
