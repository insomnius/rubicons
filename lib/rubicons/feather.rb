# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Feather
    autoload :RailsHelper, 'rubicons/feather/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/feather', __dir__)

    class << self
      def pack_name
        'Feather Icons'
      end

      def pack_description
        'Feather is a collection of simply beautiful open source icons designed by Cole Bemis. Each icon is designed on a 24×24 grid with an emphasis on simplicity, consistency, and readability.'
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
