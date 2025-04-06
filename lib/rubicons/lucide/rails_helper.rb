# frozen_string_literal: true

module Rubicons
  # Rails view helper for Lucide icons
  module Lucide::Helper
    def lucide_icon(name, options = {})
      Rubicons::Lucide.icon(name, **options)
    end
  end
end
