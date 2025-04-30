# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module MaterialDesign
    autoload :RailsHelper, 'rubicons/material_design/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/material_design', __dir__)

    class << self
      def pack_name
        'Material Design Icons'
      end

      def pack_description
        'Material Design Icons is a collection of icons based on Google\'s Material Design guidelines, providing thousands of icons across various categories for modern web and app development.'
      end

      def license
        'Apache 2.0'
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
