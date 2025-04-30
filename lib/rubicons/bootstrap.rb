# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module Bootstrap
    autoload :RailsHelper, 'rubicons/bootstrap/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/bootstrap', __dir__)

    class << self
      def pack_name
        'Bootstrap Icons'
      end

      def pack_description
        'Bootstrap Icons is a free, high-quality icon library with over 1,500 icons. It is designed to work seamlessly with Bootstrap and other frameworks.'
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
