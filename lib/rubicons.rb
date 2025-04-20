# frozen_string_literal: true

require 'rubicons/version'
require 'rubicons/railtie' if defined?(Rails)
require 'rubicons/base_icon_set'

module Rubicons
  autoload :Lucide, 'rubicons/lucide'
  autoload :Radix, 'rubicons/radix'
  autoload :CircumIcons, 'rubicons/circum_icons'
  autoload :FontAwesome5, 'rubicons/font_awesome5'
  autoload :FontAwesome6, 'rubicons/font_awesome6'
  autoload :Ionicons4, 'rubicons/ionicons4'
  autoload :Ionicons5, 'rubicons/ionicons5'
  autoload :MaterialDesign, 'rubicons/material_design'
  autoload :Typicons, 'rubicons/typicons'
  autoload :Octicons, 'rubicons/octicons'
  autoload :Feather, 'rubicons/feather'
  autoload :GameIcons, 'rubicons/game_icons'
  autoload :WeatherIcons, 'rubicons/weather_icons'
  autoload :Devicons, 'rubicons/devicons'
  autoload :AntDesign, 'rubicons/ant_design'
  autoload :Bootstrap, 'rubicons/bootstrap'
  autoload :RemixIcon, 'rubicons/remix_icon'
  autoload :FlatColorIcons, 'rubicons/flat_color_icons'
  autoload :GrommetIcons, 'rubicons/grommet_icons'
  autoload :Heroicons, 'rubicons/heroicons'
  autoload :Heroicons2, 'rubicons/heroicons2'
  autoload :SimpleIcons, 'rubicons/simple_icons'
  autoload :SimpleLineIcons, 'rubicons/simple_line_icons'
  autoload :IcoMoon, 'rubicons/ico_moon'
  autoload :BoxIcons, 'rubicons/box_icons'
  autoload :CssGg, 'rubicons/css_gg'
  autoload :VsCodeIcons, 'rubicons/vs_code_icons'
  autoload :TablerIcons, 'rubicons/tabler_icons'
  autoload :ThemifyIcons, 'rubicons/themify_icons'
  autoload :PhosphorIcons, 'rubicons/phosphor_icons'
  autoload :LineAwesome, 'rubicons/line_awesome'

  class << self
  end
end
