# frozen_string_literal: true

module Rubicons
  module TablerIcons
    # Rails view helper for Tabler Icons
    module RailsHelper
      def tabler_icon(name, options = {})
        Rubicons::TablerIcons.icon(name, **options).html_safe
      end
    end
  end
end
