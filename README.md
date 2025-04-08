# Rubicons

Rubicons is a lightweight, pure Ruby SVG icon toolkit inspired by React Icons. It provides a simple and consistent way to include beautiful SVG icons in your Ruby and Rails applications without external dependencies.

[![Gem Version](https://badge.fury.io/rb/rubicons.svg)](https://badge.fury.io/rb/rubicons)

## Features

- **Pure Ruby implementation** - no JavaScript dependencies
- **SVG-based icons** - scalable without quality loss
- **Multiple icon libraries** - access thousands of icons from popular icon sets
- **Rails integration** - seamlessly works with Rails via helper methods
- **Customizable** - easily change size, color, and add CSS classes

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubicons'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install rubicons
```

## Icon Collections

Rubicons provides access to **20** popular icon libraries with thousands of icons:

| Icon Library | Version | License | Count | Example Icons |
| --- | --- | --- | ---: | --- |
| [Lucide](https://lucide.dev/) | Latest | [ISC](https://github.com/lucide-icons/lucide/blob/main/LICENSE) | 1,565+ | `activity`, `alert-circle`, `arrow-right`, `check`, `heart` |
| [Radix UI](https://www.radix-ui.com/icons) | Latest | [MIT](https://github.com/radix-ui/icons/blob/master/LICENSE) | 318+ | `accessible`, `archive`, `bell`, `calendar`, `caret-right` |
| [Bootstrap](https://icons.getbootstrap.com/) | v1.11.3 | [MIT](https://github.com/twbs/icons/blob/main/LICENSE) | 1,800+ | `alarm`, `arrow-left`, `calendar`, `chat`, `heart` |
| [Box Icons](https://boxicons.com/) | Latest | [MIT/CC 4.0](https://github.com/atisawd/boxicons/blob/master/LICENSE) | 1,500+ | `bx-home`, `bx-search`, `bx-menu`, `bx-user`, `bxl-github` |
| [Circum Icons](https://circumicons.com/) | Latest | [MPL-2.0](https://github.com/Klarr-Agency/Circum-Icons/blob/main/LICENSE) | 244+ | `arrow`, `check`, `home`, `menu`, `user` |
| [Feather](https://feathericons.com/) | v4.29.1 | [MIT](https://github.com/feathericons/feather/blob/master/LICENSE) | 287+ | `activity`, `award`, `cloud`, `message-square`, `star` |
| [Font Awesome 5](https://fontawesome.com/) | v5.15.4 | [Multiple](https://github.com/FortAwesome/Font-Awesome/blob/5.x/LICENSE.txt) | 1,612+ | `user`, `home`, `university`, `paper-plane`, `star` |
| [Font Awesome 6](https://fontawesome.com/) | v6.5.2 | [Multiple](https://github.com/FortAwesome/Font-Awesome/blob/6.x/LICENSE.txt) | 2,025+ | `user-nurse`, `house`, `flag`, `shield`, `tachograph-digital` |
| [Heroicons v1](https://v1.heroicons.com/) | v1.0.6 | [MIT](https://github.com/tailwindlabs/heroicons/blob/master/LICENSE) | 230+ | `academic-cap`, `folder-remove`, `home`, `menu`, `user` |
| [Heroicons v2](https://heroicons.com/) | v2.1.3 | [MIT](https://github.com/tailwindlabs/heroicons/blob/master/LICENSE) | 285+ | `academic-cap`, `arrow-left`, `home`, `tv`, `user` |
| [Ionicons 4](https://ionic.io/ionicons/v4) | v4.6.4-1 | [MIT](https://github.com/ionic-team/ionicons/blob/main/LICENSE) | 696+ | `add`, `alarm`, `home`, `mail`, `menu` |
| [Ionicons 5](https://ionic.io/ionicons) | v5.5.4 | [MIT](https://github.com/ionic-team/ionicons/blob/main/LICENSE) | 1,300+ | `add`, `alarm`, `home`, `mail`, `menu` |
| [Line Awesome](https://icons8.com/line-awesome) | Latest | [MIT/Good Boy](https://github.com/icons8/line-awesome/blob/master/LICENSE.md) | 1,544+ | `address-book`, `heart`, `twitter`, `user`, `youtube` |
| [Material Design](https://materialdesignicons.com/) | v4.0.0 | [Apache 2.0](https://github.com/google/material-design-icons/blob/master/LICENSE) | 1,100+ | `3d-rotation`, `accessibility`, `account-circle`, `home`, `settings` |
| [Octicons](https://primer.github.io/octicons/) | v18.3.0 | [MIT](https://github.com/primer/octicons/blob/main/LICENSE) | 200+ | `alert`, `check`, `code`, `git-branch`, `mark-github` |
| [Phosphor Icons](https://phosphoricons.com/) | Latest | [MIT](https://github.com/phosphor-icons/core/blob/main/LICENSE) | 6,200+ | `activity`, `airplane`, `bell`, `car`, `user` |
| [Remix Icon](https://remixicon.com/) | v4.2.0 | [Apache 2.0](https://github.com/Remix-Design/RemixIcon/blob/master/License) | 2,700+ | `home`, `user`, `settings`, `search`, `arrow-right` |
| [Tabler Icons](https://tabler-icons.io/) | v3.31.0 | [MIT](https://github.com/tabler/tabler-icons/blob/master/LICENSE) | 4,700+ | `home`, `user`, `settings`, `search`, `arrow-right` |
| [Typicons](https://www.s-ings.com/typicons/) | v2.1.2 | [SIL OFL](https://github.com/stephenhutchings/typicons.font/blob/master/README.md#license) | 336+ | `anchor`, `heart`, `home`, `user`, `warning` |
| [Weather Icons](https://erikflowers.github.io/weather-icons/) | v2.0.12 | [SIL OFL 1.1](https://github.com/erikflowers/weather-icons/blob/master/COPYING) | 219+ | `cloud`, `day-sunny`, `rain`, `snow`, `wind` |

## Usage

### Standalone Usage

You can use Rubicons in any Ruby application without Rails. First, require the gem:

```ruby
require 'rubicons'
```

Then use any of the icon libraries:

#### Using Lucide Icons

```ruby
# Get an icon with default options (medium size)
svg = Rubicons::Lucide.icon('heart')

# With custom size
svg = Rubicons::Lucide.icon('heart', size: :lg)

# With custom class
svg = Rubicons::Lucide.icon('heart', class: 'text-red-500')

# List all available icons
icon_names = Rubicons::Lucide.available_icons
```

#### Using Bootstrap Icons

```ruby
# Get an icon with default options
svg = Rubicons::Bootstrap.icon('heart-fill')

# With custom size
svg = Rubicons::Bootstrap.icon('heart-fill', size: :xl)

# With custom class
svg = Rubicons::Bootstrap.icon('heart-fill', class: 'text-danger')
```

#### Using Font Awesome Icons

```ruby
# Font Awesome 5
svg = Rubicons::FontAwesome5.icon('solid-paper-plane')

# Font Awesome 6
svg = Rubicons::FontAwesome6.icon('solid-user-nurse')
```

#### Using Heroicons

```ruby
# Heroicons v1
svg = Rubicons::Heroicons.icon('outline-folder-remove')

# Heroicons v2
svg = Rubicons::Heroicons2.icon('16-solid-tv')
```

### Rails Integration

In a Rails application, Rubicons automatically integrates with ActionView to provide helper methods for each icon library:

```erb
<%# Lucide Icons %>
<%= lucide_icon 'heart', class: 'text-red-500', size: :lg %>

<%# Radix Icons %>
<%= radix_icon 'heart', class: 'icon-primary' %>

<%# Bootstrap Icons %>
<%= bootstrap_icon 'heart-fill', class: 'text-danger' %>

<%# Box Icons %>
<%= box_icon 'bx-home' %>

<%# Font Awesome 5 %>
<%= fa5_icon 'solid-paper-plane', size: :xl %>

<%# Font Awesome 6 %>
<%= fa6_icon 'solid-user-nurse' %>

<%# Heroicons v1 %>
<%= heroicon 'outline-folder-remove' %>

<%# Heroicons v2 %>
<%= heroicon2 '16-solid-tv' %>

<%# Circum Icons %>
<%= circum_icon 'arrow' %>

<%# Feather Icons %>
<%= feather_icon 'activity' %>

<%# Ionicons 4 %>
<%= ion4_icon 'home' %>
```

### Available Sizes

All icons support the following size options:

| Size | Dimensions |
| --- | --- |
| `:xs` | 12×12 |
| `:sm` | 16×16 |
| `:md` | 20×20 (default) |
| `:lg` | 24×24 |
| `:xl` | 32×32 |
| `:2xl` | 40×40 |

## Example SVG Output

When you use `Rubicons::Lucide.icon('heart')`, you get this SVG:

```html
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"/></svg>
```

When you use `Rubicons::FontAwesome6.icon('solid-user-nurse')`, you get an SVG like:

```html
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 448 512"><path d="M224 0c70.7 0 128 57.3 128 128v32h32c17.7 0 32 14.3 32 32v32c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V192c0-17.7 14.3-32 32-32h32V128C128 57.3 185.3 0 256 0h-32zM144 128v32h160V128c0-53-43-96-96-96s-96 43-96 96zM336 480v-48c0-61.9-50.1-112-112-112s-112 50.1-112 112v48c-17.7 0-32-14.3-32-32V352.8c0-48 35-88.2 82.7-94.9l21.4-3c28.2-4 57.5-4 85.8 0l21.4 3c47.8 6.7 82.7 46.9 82.7 94.9V448c0 17.7-14.3 32-32 32zM209.7 299c-7.1 2.7-11.4 9.8-10.4 17.3l4 30c1.3 9.9 13.9 13 20.5 5l16.8-20.5c2.4-3 7.1-3 9.5 0l16.8 20.5c6.6 8 19.2 4.9 20.5-5l4-30c1-7.5-3.3-14.6-10.4-17.3C259.8 290.7 242.7 288 224 288s-35.8 2.7-47.7 7c.8 1 1.7 2 2.7 3l6.7 8.5c.3 .4 .7 .5 1.1 .5c.2 0 .4-.1 .6-.1c5.5-1.4 11.3-2.2 17.3-2.7c10.1-.9 20.7-.9 30.8 0c6 .5 11.8 1.4 17.3 2.7c.2 .1 .4 .1 .6 .1c.4 0 .8-.2 1.1-.5l6.7-8.5c.3-.4 .7-.2 1.2-1.4c.5-1.7-.2-1.7-1.2-1.7c-7.7-2.3-15.9-3.9-24.3-4.8c-11.6-1.3-23.6-1.3-35.2 0c-8.4 .9-16.6 2.6-24.3 4.8c-1 .3-1.7 0-1.2 1.7c.4 1.2 .9 1 1.2 1.4l6.7 8.5z"/></svg>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/insomnius/rubicons.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).