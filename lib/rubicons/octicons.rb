# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Octicons
    autoload :RailsHelper, 'rubicons/octicons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/octicons', __dir__)

    class << self
      def pack_name
        'Octicons'
      end

      def description
        'Octicons are GitHub\'s open-source icon set, providing a clean and consistent way to add visual elements to your project with icons used across GitHub\'s interface.'
      end

      def license
        'MIT'
      end

      def icon(name, **options)
        BaseIconSet.render_icon(name, ICONS_PATH, **options)
      end

      def icon!(name, **options)
        BaseIconSet.render_icon!(name, ICONS_PATH, **options)
      end

      def available_icons
        BaseIconSet.available_icons(ICONS_PATH)
      end
    end
  end
end
