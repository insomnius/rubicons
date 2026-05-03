# frozen_string_literal: true

module Rubicons
  module EosIcons
    # Rails view helper for EOS Icons
    module RailsHelper
      def eos_icon(name, options = {})
        Rubicons::EosIcons.icon(name, **options).html_safe
      end

      def eos_icon!(name, options = {})
        Rubicons::EosIcons.icon!(name, **options).html_safe
      end
    end
  end
end
