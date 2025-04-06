# frozen_string_literal: true

require 'rubicons/version'
require 'rubicons/railtie' if defined?(Rails)

module Rubicons
  autoload :Lucide, 'rubicons/lucide'
  autoload :Radix, 'rubicons/radix'

  class << self
  end
end
