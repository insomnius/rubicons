# frozen_string_literal: true

module Rubicons
  module Lucide
    # Rails view helper for Lucide icons
    module Helper
      # Renders a Lucide icon in Rails views
      #
      # @param name [String, Symbol] the name of the icon
      # @param options [Hash] custom attributes to override defaults
      # @param html_options [Hash] additional HTML attributes for the SVG element
      # @return [ActiveSupport::SafeBuffer] HTML-safe SVG markup
      #
      # @example Basic usage
      #   <%= lucide_icon :alert_circle %>
      #
      # @example With custom size and color
      #   <%= lucide_icon "check", width: 32, height: 32, stroke: "#22c55e" %>
      #
      # @example With additional HTML attributes
      #   <%= lucide_icon :menu, class: "sidebar-icon", data: { toggle: "dropdown" } %>
      def lucide_icon(name, options = {}, html_options = {})
        # Process HTML options
        html_attributes = {}
        html_options.each do |key, value|
          case key
          when :class, :id, :style
            html_attributes[key] = value
          when :data
            value.each do |data_key, data_value|
              html_attributes["data-#{data_key}"] = data_value
            end
          else
            html_attributes[key] = value
          end
        end

        # Merge HTML attributes with SVG options
        merged_options = options.merge(html_attributes)

        # Get SVG content and mark as HTML safe
        svg_content = Rubicons::Lucide.icon(name, **merged_options)
        svg_content.html_safe
      end

      # Creates an icon with optional text
      #
      # @param name [String, Symbol] the name of the icon
      # @param text [String] optional text to display next to the icon
      # @param options [Hash] custom attributes for the icon
      # @param html_options [Hash] additional HTML attributes
      # @return [ActiveSupport::SafeBuffer] HTML-safe markup
      #
      # @example Icon with text
      #   <%= lucide_icon_with_text :info, "Information", class: "info-block" %>
      def lucide_icon_with_text(name, text = nil, options = {}, html_options = {})
        icon = lucide_icon(name, options, html_options)

        if text.present?
          wrapper_class = html_options.delete(:wrapper_class) || 'icon-with-text'
          text_class = html_options.delete(:text_class) || 'icon-text'

          content_tag :span, class: wrapper_class do
            icon + content_tag(:span, text, class: text_class)
          end
        else
          icon
        end
      end
    end
  end
end

# Automatically include the helper in ActionView if Rails is defined
if defined?(Rails)
  ActiveSupport.on_load(:action_view) do
    include Rubicons::Lucide::Helper
  end
end
