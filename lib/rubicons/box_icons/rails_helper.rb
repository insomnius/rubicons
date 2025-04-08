# frozen_string_literal: true

module Rubicons
  module BoxIcons
    # Rails view helper for Box Icons
    module RailsHelper
      def box_icon(name, options = {})
        Rubicons::BoxIcons.icon(name, **options).html_safe
      end
    end
  end
end
