# frozen_string_literal: true

require 'rails'
require 'rubicons/lucide'

module Rubicons
  # Railtie to integrate Rubicons with Rails
  class Railtie < Rails::Railtie
    initializer 'rubicons.helpers' do
      ActiveSupport.on_load(:action_view) do
        include Rubicons::Lucide::RailsHelper
      end
    end
  end
end
