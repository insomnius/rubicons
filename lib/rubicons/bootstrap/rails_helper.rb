# frozen_string_literal: true

module Rubicons
  module Bootstrap
    # Rails view helper for Bootstrap icons
    module RailsHelper
      def bootstrap_icon(name, options = {})
        Rubicons::Bootstrap.icon(name, **options).html_safe
      end
    end
  end
end
