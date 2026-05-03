# frozen_string_literal: true

require 'rails'
require 'rubicons/ant_design'
require 'rubicons/bootstrap'
require 'rubicons/box_icons'
require 'rubicons/carbon_icons'
require 'rubicons/circum_icons'
require 'rubicons/css_gg'
require 'rubicons/devicon'
require 'rubicons/eos_icons'
require 'rubicons/feather'
require 'rubicons/flat_color_icons'
require 'rubicons/fluent_ui_icons'
require 'rubicons/font_awesome5'
require 'rubicons/font_awesome6'
require 'rubicons/game_icons'
require 'rubicons/grommet_icons'
require 'rubicons/heroicons'
require 'rubicons/heroicons2'
require 'rubicons/ico_moon'
require 'rubicons/iconoir'
require 'rubicons/ionicons4'
require 'rubicons/ionicons5'
require 'rubicons/line_awesome'
require 'rubicons/lineicons'
require 'rubicons/lucide'
require 'rubicons/majesticons'
require 'rubicons/material_design'
require 'rubicons/material_symbols'
require 'rubicons/ming_cute'
require 'rubicons/myna_ui_icons'
require 'rubicons/octicons'
require 'rubicons/phosphor_icons'
require 'rubicons/pixelarticons'
require 'rubicons/radix'
require 'rubicons/remix_icon'
require 'rubicons/simple_icons'
require 'rubicons/simple_line_icons'
require 'rubicons/tabler_icons'
require 'rubicons/themify_icons'
require 'rubicons/typicons'
require 'rubicons/vs_code_icons'
require 'rubicons/weather_icons'

module Rubicons
  # Railtie to integrate Rubicons with Rails
  class Railtie < Rails::Railtie
    initializer 'rubicons.helpers' do
      ActiveSupport.on_load(:action_view) do
        include Rubicons::AntDesign::RailsHelper
        include Rubicons::Bootstrap::RailsHelper
        include Rubicons::BoxIcons::RailsHelper
        include Rubicons::CarbonIcons::RailsHelper
        include Rubicons::CircumIcons::RailsHelper
        include Rubicons::CssGg::RailsHelper
        include Rubicons::Devicon::RailsHelper
        include Rubicons::EosIcons::RailsHelper
        include Rubicons::Feather::RailsHelper
        include Rubicons::FlatColorIcons::RailsHelper
        include Rubicons::FluentUiIcons::RailsHelper
        include Rubicons::FontAwesome5::RailsHelper
        include Rubicons::FontAwesome6::RailsHelper
        include Rubicons::GameIcons::RailsHelper
        include Rubicons::GrommetIcons::RailsHelper
        include Rubicons::Heroicons::RailsHelper
        include Rubicons::Heroicons2::RailsHelper
        include Rubicons::IcoMoon::RailsHelper
        include Rubicons::Iconoir::RailsHelper
        include Rubicons::Ionicons4::RailsHelper
        include Rubicons::Ionicons5::RailsHelper
        include Rubicons::LineAwesome::RailsHelper
        include Rubicons::Lineicons::RailsHelper
        include Rubicons::Lucide::RailsHelper
        include Rubicons::Majesticons::RailsHelper
        include Rubicons::MaterialDesign::RailsHelper
        include Rubicons::MaterialSymbols::RailsHelper
        include Rubicons::MingCute::RailsHelper
        include Rubicons::MynaUiIcons::RailsHelper
        include Rubicons::Octicons::RailsHelper
        include Rubicons::PhosphorIcons::RailsHelper
        include Rubicons::Pixelarticons::RailsHelper
        include Rubicons::Radix::RailsHelper
        include Rubicons::RemixIcon::RailsHelper
        include Rubicons::SimpleIcons::RailsHelper
        include Rubicons::SimpleLineIcons::RailsHelper
        include Rubicons::TablerIcons::RailsHelper
        include Rubicons::ThemifyIcons::RailsHelper
        include Rubicons::Typicons::RailsHelper
        include Rubicons::VsCodeIcons::RailsHelper
        include Rubicons::WeatherIcons::RailsHelper
      end
    end
  end
end
