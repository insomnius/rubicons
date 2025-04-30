# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module PhosphorIcons
    autoload :RailsHelper, 'rubicons/phosphor_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/phosphor_icons', __dir__)

    class << self
      def pack_name
        'Phosphor Icons'
      end

      def pack_description
        'Phosphor Icons is a flexible icon family for interfaces, diagrams, presentations and more with multiple weights and styles for versatile design applications.'
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
        @available_icons ||= BaseIconSet.available_icons(ICONS_PATH)
      end
    end
  end
end
