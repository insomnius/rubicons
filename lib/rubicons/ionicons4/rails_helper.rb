# frozen_string_literal: true

module Rubicons
  module Ionicons4
    # Rails view helper for Ionicons 4
    module RailsHelper
      def ion4_icon(name, options = {})
        Rubicons::Ionicons4.icon(name, **options).html_safe
      end
    end
  end
end
