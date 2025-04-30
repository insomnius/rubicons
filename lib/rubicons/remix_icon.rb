# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module RemixIcon
    autoload :RailsHelper, 'rubicons/remix_icon/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/remix_icon', __dir__)

    class << self
      def pack_name
        'Remix Icon'
      end

      def pack_description
        'Remix Icon is a set of open-source neutral-style system symbols for designers and developers. Unlike other icon sets, Remix Icon provides more than 2000 icons in various categories.'
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
