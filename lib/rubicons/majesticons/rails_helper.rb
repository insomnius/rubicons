# frozen_string_literal: true

module Rubicons
  module Majesticons
    # Rails view helper for Majesticons icons
    module RailsHelper
      def majesticons_icon(name, options = {})
        Rubicons::Majesticons.icon(name, **options).html_safe
      end

      def majesticons_icon!(name, options = {})
        Rubicons::Majesticons.icon!(name, **options).html_safe
      end
    end
  end
end
