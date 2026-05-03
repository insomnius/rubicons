# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module FluentUiIcons
    autoload :RailsHelper, 'rubicons/fluent_ui_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/fluent_ui_icons', __dir__)

    class << self
      def pack_name
        'Fluent UI System Icons'
      end

      def pack_description
        'Fluent UI System Icons is a collection of familiar, friendly and modern icons from Microsoft, available in regular and filled styles.'
      end

      def license
        'MIT'
      end

      def icon(name, **options)
        BaseIconSet.render_icon(name, ICONS_PATH, self, **options)
      end

      def icon!(name, **options)
        BaseIconSet.render_icon!(name, ICONS_PATH, self, **options)
      end

      def available_icons
        @available_icons ||= BaseIconSet.available_icons(ICONS_PATH)
      end

      def fill_color
        'currentColor'
      end

      def stroke_color
        'none'
      end
    end
  end
end
