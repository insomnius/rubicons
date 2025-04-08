# frozen_string_literal: true

module Rubicons
  module Heroicons
    # Rails view helper for Heroicons
    module RailsHelper
      def heroicon(name, options = {})
        Rubicons::Heroicons.icon(name, **options).html_safe
      end
    end
  end
end
