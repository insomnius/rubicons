# frozen_string_literal: true

module Rubicons
  module PhosphorIcons
    # Rails view helper for Phosphor Icons
    module RailsHelper
      def phosphor_icon(name, options = {})
        Rubicons::PhosphorIcons.icon(name, **options).html_safe
      end
    end
  end
end
