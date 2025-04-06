# frozen_string_literal: true

require 'rails'
require_relative 'lucide'

module Rubicons
  # Railtie to integrate Rubicons with Rails
  class Railtie < Rails::Railtie
    initializer 'rubicons.helpers' do
      ActiveSupport.on_load(:action_view) do
        include Rubicons::Lucide::Helper
      end
    end
  end
end
