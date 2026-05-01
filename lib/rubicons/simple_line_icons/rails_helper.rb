# frozen_string_literal: true

module Rubicons
  module SimpleLineIcons
    # Rails view helper for Simple Line Icons
    module RailsHelper
      def simple_line_icon(name, options = {})
        Rubicons::SimpleLineIcons.icon(name, **options).html_safe
      end

      def simple_line_icon!(name, options = {})
        Rubicons::SimpleLineIcons.icon!(name, **options).html_safe
      end
    end
  end
end
