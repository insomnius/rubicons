# frozen_string_literal: true

require 'nokogiri'

module Rubicons
  # Base module for icon sets with common functionality
  module BaseIconSet
    # Default size mapping that can be overridden by specific icon sets
    DEFAULT_SIZE_MAP = {
      xs:    '12',
      sm:    '16',
      md:    '20',
      lg:    '24',
      xl:    '32',
      "2xl": '40'
    }.freeze

    # Helper method to render an SVG icon with customizations
    # @param name [String, Symbol] icon name
    # @param icons_path [String] path to icons directory
    # @param options [Hash] options for customizing the icon
    # @option options [Symbol, String] :size (:md) size of the icon
    # @option options [String] :class CSS classes to add
    # @option options [Hash] :size_map custom size mapping
    # @return [String] rendered SVG
    def render_icon(name, icons_path, **options)
      icon_path = File.join(icons_path, "#{name}.svg")
      raise ArgumentError, "Icon '#{name}' not found" unless File.exist?(icon_path)

      svg = File.read(icon_path)
      doc = Nokogiri::HTML::DocumentFragment.parse(svg)
      svg_element = doc.at_css 'svg'

      size_map = options.delete(:size_map) || self::SIZE_MAP
      size_key = (options.delete(:size) || :md).to_sym
      svg_size = size_map[size_key] || size_map[:md]

      svg_element['width']  = svg_size
      svg_element['height'] = svg_size

      apply_options_to_svg(svg_element, options)

      svg_element.to_s
    end

    # Helper method to apply options to an SVG element
    # @param svg_element [Nokogiri::XML::Element] SVG element to modify
    # @param options [Hash] options to apply
    # @return [Nokogiri::XML::Element] modified SVG element
    def apply_options_to_svg(svg_element, options)
      svg_element['class'] = options.delete(:class) if options[:class]
      svg_element['stroke'] = options.delete(:stroke) if options[:stroke]
      svg_element['fill'] = options.delete(:fill) if options[:fill]
      svg_element['stroke-width'] = options.delete(:stroke_width).to_s if options[:stroke_width]

      # Add any remaining attributes from options
      options.each do |key, value|
        svg_element[key.to_s.tr('_', '-')] = value.to_s
      end

      svg_element
    end

    # Helper method to load all available icon names
    # @param icons_path [String] path to icons directory
    # @return [Array<Symbol>] list of available icon names
    def available_icons(icons_path)
      Dir.glob("#{icons_path}/*.svg").map { |path| File.basename(path, '.svg').to_sym }
    end
  end
end
