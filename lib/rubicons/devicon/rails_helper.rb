# frozen_string_literal: true

module Rubicons
  module Devicon
    # Rails view helper for Devicon icons
    module RailsHelper
      def devicon_icon(name, options = {})
        Rubicons::Devicon.icon(name, **options).html_safe
      end

      def devicon_icon!(name, options = {})
        Rubicons::Devicon.icon!(name, **options).html_safe
      end
    end
  end
end
