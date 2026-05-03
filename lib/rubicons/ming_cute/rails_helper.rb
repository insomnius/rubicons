# frozen_string_literal: true

module Rubicons
  module MingCute
    # Rails view helper for MingCute icons
    module RailsHelper
      def ming_cute_icon(name, options = {})
        Rubicons::MingCute.icon(name, **options).html_safe
      end

      def ming_cute_icon!(name, options = {})
        Rubicons::MingCute.icon!(name, **options).html_safe
      end
    end
  end
end
