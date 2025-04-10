# frozen_string_literal: true

module Rubicons
  module LineAwesome
    # Rails view helper for Line Awesome icons
    module RailsHelper
      def la_icon(name, options = {})
        Rubicons::LineAwesome.icon(name, **options).html_safe
      end

      def la_icon!(name, options = {})
        Rubicons::LineAwesome.icon!(name, **options).html_safe
      end
    end
  end
end
