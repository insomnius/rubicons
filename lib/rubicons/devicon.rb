# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Devicon
    autoload :RailsHelper, 'rubicons/devicon/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/devicon', __dir__)

    class << self
      def pack_name
        'Devicon'
      end

      def pack_description
        'Devicon is a set of icons representing programming languages, designing, and development tools. You can use it as a font or directly copy/paste the SVG code into your project.'
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
