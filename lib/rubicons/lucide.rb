# frozen_string_literal: true

require 'nokogiri'

module Rubicons
  class Lucide
    SIZE_MAP = {
      xs:    '12',
      sm:    '16',
      md:    '20',
      lg:    '24',
      xl:    '32',
      "2xl": '40'
    }.freeze

    ICONS_PATH = File.expand_path('../../icons/lucide', __dir__)

    # Returns SVG markup for the specified icon
    # @param name [String, Symbol] the name of the icon
    # @param options [Hash] custom attributes to override defaults
    # @return [String] SVG markup
    def self.icon(name, **options)
      icon_path = File.join(ICONS_PATH, "#{name}.svg")
      raise ArgumentError, "Icon '#{name}' not found" unless File.exist?(icon_path)

      svg = File.read(icon_path)
      doc = Nokogiri::HTML::DocumentFragment.parse(svg)
      svg_element = doc.at_css 'svg'

      size_key = (options.delete(:size) || :md).to_sym
      svg_size = SIZE_MAP[size_key] || SIZE_MAP[:md]

      svg_element['width']  = svg_size
      svg_element['height'] = svg_size
      svg_element['class'] = options.delete(:class) if options[:class]

      svg_element.to_s
    end

    # Helper method to load all available icon names
    # @return [Array<Symbol>] list of available icon names
    def self.available_icons
      Dir.glob("#{ICONS_PATH}/*.svg").map { |path| File.basename(path, '.svg').to_sym }
    end
  end
end
