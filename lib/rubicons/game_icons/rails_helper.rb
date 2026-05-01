# frozen_string_literal: true

module Rubicons
  module GameIcons
    # Rails view helper for Game Icons
    module RailsHelper
      def game_icon(name, options = {})
        Rubicons::GameIcons.icon(name, **options).html_safe
      end

      def game_icon!(name, options = {})
        Rubicons::GameIcons.icon!(name, **options).html_safe
      end
    end
  end
end
