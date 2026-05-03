# frozen_string_literal: true

require 'nokogiri'
require 'rubicons/base_icon_set'

module Rubicons
  module EosIcons
    autoload :RailsHelper, 'rubicons/eos_icons/rails_helper'

    ICONS_PATH = File.expand_path('../../icons/eos_icons', __dir__)

    class << self
      def pack_name
        'EOS Icons'
      end

      def pack_description
        'EOS Icons is an MIT-licensed icon library by SUSE that follows the Material Design guidelines. It ships outlined and filled monochrome variants suitable for product UI.'
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
