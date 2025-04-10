# frozen_string_literal: true

module Rubicons
  module Lucide
    # Rails view helper for Lucide icons
    module RailsHelper
      def lucide_icon(name, options = {})
        Rubicons::Lucide.icon(name, **options).html_safe
      end

      def lucide_icon!(name, options = {})
        Rubicons::Lucide.icon!(name, **options).html_safe
      end
    end
  end
end
