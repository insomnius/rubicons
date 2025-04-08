# frozen_string_literal: true

module Rubicons
  module Octicons
    # Rails view helper for GitHub Octicons
    module RailsHelper
      def octicon(name, options = {})
        Rubicons::Octicons.icon(name, **options).html_safe
      end
    end
  end
end
