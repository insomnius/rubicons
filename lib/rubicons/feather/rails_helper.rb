# frozen_string_literal: true

module Rubicons
  module Feather
    # Rails view helper for Feather icons
    module RailsHelper
      def feather_icon(name, options = {})
        Rubicons::Feather.icon(name, **options).html_safe
      end
    end
  end
end
