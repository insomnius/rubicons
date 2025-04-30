# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Typicons
    autoload :RailsHelper, 'rubicons/typicons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/typicons', __dir__)

    class << self
      def pack_name
        'Typicons'
      end

      def pack_description
        'Typicons is a carefully crafted set of free-to-use vector icons with a minimal and modern style that can be used in both personal and commercial projects.'
      end

      def license
        'SIL OFL 1.1'
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
