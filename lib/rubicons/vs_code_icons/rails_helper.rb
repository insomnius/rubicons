# frozen_string_literal: true

module Rubicons
  module VsCodeIcons
    # Rails view helper for VS Code Icons
    module RailsHelper
      def vs_code_icon(name, options = {})
        Rubicons::VsCodeIcons.icon(name, **options).html_safe
      end

      def vs_code_icon!(name, options = {})
        Rubicons::VsCodeIcons.icon!(name, **options).html_safe
      end
    end
  end
end
