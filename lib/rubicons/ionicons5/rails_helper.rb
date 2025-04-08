# frozen_string_literal: true

module Rubicons
  module Ionicons5
    # Rails view helper for Ionicons 5
    module RailsHelper
      def ion5_icon(name, options = {})
        Rubicons::Ionicons5.icon(name, **options).html_safe
      end
    end
  end
end
