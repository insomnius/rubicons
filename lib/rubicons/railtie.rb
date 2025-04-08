# frozen_string_literal: true

require 'rails'
require 'rubicons/lucide'
require 'rubicons/radix'
require 'rubicons/circum_icons'
require 'rubicons/font_awesome5'
require 'rubicons/font_awesome6'
require 'rubicons/ionicons4'
require 'rubicons/ionicons5'
require 'rubicons/material_design'
require 'rubicons/typicons'
require 'rubicons/octicons'
require 'rubicons/feather'
require 'rubicons/game_icons'
require 'rubicons/weather_icons'
require 'rubicons/devicons'
require 'rubicons/ant_design'
require 'rubicons/bootstrap'
require 'rubicons/remix_icon'
require 'rubicons/flat_color_icons'
require 'rubicons/grommet_icons'
require 'rubicons/heroicons'
require 'rubicons/heroicons2'
require 'rubicons/simple_icons'
require 'rubicons/simple_line_icons'
require 'rubicons/ico_moon'
require 'rubicons/box_icons'
require 'rubicons/css_gg'
require 'rubicons/vs_code_icons'
require 'rubicons/tabler_icons'
require 'rubicons/themify_icons'
require 'rubicons/phosphor_icons'
require 'rubicons/line_awesome'

module Rubicons
  # Railtie to integrate Rubicons with Rails
  class Railtie < Rails::Railtie
    initializer 'rubicons.helpers' do
      ActiveSupport.on_load(:action_view) do
        include Rubicons::Lucide::RailsHelper
        include Rubicons::Radix::RailsHelper
        include Rubicons::CircumIcons::RailsHelper
        include Rubicons::FontAwesome5::RailsHelper
        include Rubicons::FontAwesome6::RailsHelper
        include Rubicons::Ionicons4::RailsHelper
        include Rubicons::Ionicons5::RailsHelper
        include Rubicons::MaterialDesign::RailsHelper
        include Rubicons::Typicons::RailsHelper
        include Rubicons::Octicons::RailsHelper
        include Rubicons::Feather::RailsHelper
        include Rubicons::GameIcons::RailsHelper if defined?(Rubicons::GameIcons)
        include Rubicons::WeatherIcons::RailsHelper
        include Rubicons::Devicons::RailsHelper if defined?(Rubicons::Devicons)
        include Rubicons::AntDesign::RailsHelper if defined?(Rubicons::AntDesign)
        include Rubicons::Bootstrap::RailsHelper
        include Rubicons::RemixIcon::RailsHelper
        include Rubicons::FlatColorIcons::RailsHelper if defined?(Rubicons::FlatColorIcons)
        include Rubicons::GrommetIcons::RailsHelper if defined?(Rubicons::GrommetIcons)
        include Rubicons::Heroicons::RailsHelper
        include Rubicons::Heroicons2::RailsHelper
        include Rubicons::SimpleIcons::RailsHelper
        include Rubicons::SimpleLineIcons::RailsHelper if defined?(Rubicons::SimpleLineIcons)
        include Rubicons::IcoMoon::RailsHelper if defined?(Rubicons::IcoMoon)
        include Rubicons::BoxIcons::RailsHelper
        include Rubicons::CssGg::RailsHelper if defined?(Rubicons::CssGg)
        include Rubicons::VsCodeIcons::RailsHelper if defined?(Rubicons::VsCodeIcons)
        include Rubicons::TablerIcons::RailsHelper
        include Rubicons::ThemifyIcons::RailsHelper if defined?(Rubicons::ThemifyIcons)
        include Rubicons::PhosphorIcons::RailsHelper
        include Rubicons::LineAwesome::RailsHelper
      end
    end
  end
end
