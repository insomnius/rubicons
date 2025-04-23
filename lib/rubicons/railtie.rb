# frozen_string_literal: true

require 'rails'
require 'rubicons/bootstrap'
require 'rubicons/box_icons'
require 'rubicons/circum_icons'
require 'rubicons/devicon'
require 'rubicons/feather'
require 'rubicons/font_awesome5'
require 'rubicons/font_awesome6'
require 'rubicons/heroicons'
require 'rubicons/heroicons2'
require 'rubicons/ionicons4'
require 'rubicons/ionicons5'
require 'rubicons/line_awesome'
require 'rubicons/lucide'
require 'rubicons/material_design'
require 'rubicons/octicons'
require 'rubicons/phosphor_icons'
require 'rubicons/radix'
require 'rubicons/remix_icon'
require 'rubicons/simple_icons'
require 'rubicons/tabler_icons'
require 'rubicons/themify_icons'
require 'rubicons/typicons'
require 'rubicons/weather_icons'

module Rubicons
  # Railtie to integrate Rubicons with Rails
  class Railtie < Rails::Railtie
    initializer 'rubicons.helpers' do
      ActiveSupport.on_load(:action_view) do
        include Rubicons::Bootstrap::RailsHelper
        include Rubicons::BoxIcons::RailsHelper
        include Rubicons::CircumIcons::RailsHelper
        include Rubicons::Devicon::RailsHelper
        include Rubicons::Feather::RailsHelper
        include Rubicons::FontAwesome5::RailsHelper
        include Rubicons::FontAwesome6::RailsHelper
        include Rubicons::Heroicons::RailsHelper
        include Rubicons::Heroicons2::RailsHelper
        include Rubicons::Ionicons4::RailsHelper
        include Rubicons::Ionicons5::RailsHelper
        include Rubicons::LineAwesome::RailsHelper
        include Rubicons::Lucide::RailsHelper
        include Rubicons::MaterialDesign::RailsHelper
        include Rubicons::Octicons::RailsHelper
        include Rubicons::PhosphorIcons::RailsHelper
        include Rubicons::Radix::RailsHelper
        include Rubicons::RemixIcon::RailsHelper
        include Rubicons::SimpleIcons::RailsHelper
        include Rubicons::TablerIcons::RailsHelper
        include Rubicons::ThemifyIcons::RailsHelper
        include Rubicons::Typicons::RailsHelper
        include Rubicons::WeatherIcons::RailsHelper
      end
    end
  end
end
