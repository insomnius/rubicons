module Rubicons
  module ThemifyIcons
    # Rails view helper for Themify Icons
    module RailsHelper
      def themify_icon(name, options = {})
        Rubicons::ThemifyIcons.icon(name, **options).html_safe
      end

      def themify_icon!(name, options = {})
        Rubicons::ThemifyIcons.icon!(name, **options).html_safe
      end
    end
  end
end
