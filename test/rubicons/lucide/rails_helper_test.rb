# frozen_string_literal: true

require_relative '../../test_helper'
require 'rubicons/lucide'
require 'rubicons/lucide/rails_helper'

class Rubicons::Lucide::RailsHelperTest < Minitest::Test
  # Include the helper module
  include Rubicons::Lucide::RailsHelper

  class ::String
    def html_safe
      self
    end
  end

  def setup
    @test_icon_path = File.join(Rubicons::Lucide::ICONS_PATH, 'test-icon.svg')
    @svg_content = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle></svg>'

    # Create a test icon temporarily if it doesn't exist
    return if File.exist?(@test_icon_path)

    File.write(@test_icon_path, @svg_content)
    @cleanup_needed = true
  end

  def teardown
    File.delete(@test_icon_path) if @cleanup_needed && File.exist?(@test_icon_path)
  end

  def test_lucide_icon_with_string_name
    icon = lucide_icon('test-icon')
    assert_includes icon, '<svg'
    assert_includes icon, '</svg>'
    assert_includes icon, 'width="20"'
    assert_includes icon, 'height="20"'
  end

  def test_lucide_icon_with_symbol_name
    icon = lucide_icon(:'test-icon')
    assert_includes icon, '<svg'
    assert_includes icon, 'width="20"'
  end

  def test_lucide_icon_with_custom_dimensions
    icon = lucide_icon('test-icon', size: 'xl')
    assert_includes icon, 'width="32"'
    assert_includes icon, 'height="32"'
  end

  def test_lucide_icon_with_custom_dimensions_symbol
    icon = lucide_icon('test-icon', size: :xl)
    assert_includes icon, 'width="32"'
    assert_includes icon, 'height="32"'
  end

  def test_lucide_icon_with_custom_class
    icon = lucide_icon('test-icon', class: 'custom-icon')
    assert_includes icon, 'class="custom-icon"'
  end

  def test_lucide_icon_invalid_name
    assert_raises ArgumentError do
      lucide_icon('nonexistent-icon')
    end
  end
end
