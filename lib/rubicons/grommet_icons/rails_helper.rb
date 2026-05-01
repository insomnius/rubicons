# frozen_string_literal: true

module Rubicons
  module GrommetIcons
    # Rails view helper for Grommet Icons
    module RailsHelper
      def grommet_icon(name, options = {})
        Rubicons::GrommetIcons.icon(name, **options).html_safe
      end

      def grommet_icon!(name, options = {})
        Rubicons::GrommetIcons.icon!(name, **options).html_safe
      end
    end
  end
end
