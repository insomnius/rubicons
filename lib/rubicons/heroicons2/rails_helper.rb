# frozen_string_literal: true

module Rubicons
  module Heroicons2
    # Rails view helper for Heroicons v2
    module RailsHelper
      def heroicon2(name, options = {})
        Rubicons::Heroicons2.icon(name, **options).html_safe
      end

      def heroicon2!(name, options = {})
        Rubicons::Heroicons2.icon!(name, **options).html_safe
      end
    end
  end
end
