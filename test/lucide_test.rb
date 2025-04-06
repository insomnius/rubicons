# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/rubicons/lucide'

class LucideTest < Minitest::Test
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

  def test_icon_with_default_options
    icon = Rubicons::Lucide.icon('test-icon')
    assert_includes icon, 'width="20"'
    assert_includes icon, 'height="20"'
  end

  def test_icon_with_custom_size
    icon = Rubicons::Lucide.icon('test-icon', size: :lg)
    assert_includes icon, 'width="24"'
    assert_includes icon, 'height="24"'
  end

  def test_icon_with_custom_class
    icon = Rubicons::Lucide.icon('test-icon', class: 'my-icon')
    assert_includes icon, 'class="my-icon"'
  end

  def test_icon_with_invalid_size
    icon = Rubicons::Lucide.icon('test-icon', size: :invalid)
    # Should fall back to default medium size
    assert_includes icon, 'width="20"'
    assert_includes icon, 'height="20"'
  end

  def test_nonexistent_icon
    assert_raises ArgumentError do
      Rubicons::Lucide.icon('nonexistent-icon')
    end
  end

  def test_available_icons
    icons = Rubicons::Lucide.available_icons
    assert_instance_of Array, icons
    assert_includes icons, :"test-icon"
    assert(icons.all? { |icon| icon.is_a?(Symbol) })
  end
end
