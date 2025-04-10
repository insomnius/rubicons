# frozen_string_literal: true

module Rubicons
  module RemixIcon
    # Rails view helper for Remix Icons
    module RailsHelper
      def remix_icon(name, options = {})
        Rubicons::RemixIcon.icon(name, **options).html_safe
      end

      def remix_icon!(name, options = {})
        Rubicons::RemixIcon.icon!(name, **options).html_safe
      end
    end
  end
end
