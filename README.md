# rubicons

Rubicons is a Ruby gem that provides a collection of icons from various libraries. It is designed to be easy to use and integrate into your Ruby applications.

[![Gem Version](https://badge.fury.io/rb/rubicons.svg)](https://badge.fury.io/rb/rubicons)

## Installation

To install the `rubicons` gem, add this line to your application's Gemfile:

```ruby
gem 'rubicons'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rubicons

## Icons

The `rubicons` gem provides a collection of icons from various libraries. Below is a list of the available icon libraries along with their licenses, versions, and icon counts.

| Icon Library                                                            | License                                                                                           | Version                                  | Count |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------- | ----: |
| [Lucide](https://lucide.dev/)                                           | [ISC](https://github.com/lucide-icons/lucide/blob/main/LICENSE)                                   | [ed733916f30f34fb7815d76e286d9d097d73aa6b](https://github.com/lucide-icons/lucide/commit/ed733916f30f34fb7815d76e286d9d097d73aa6b)                       |  1565 |
| [Radix Icons](https://www.radix-ui.com/icons)                                           | [MIT](https://github.com/radix-ui/icons/blob/master/LICENSE)                                   | [bde33b13aa5848555f5512ac12155930fb4beb7d](https://github.com/radix-ui/icons/commit/bde33b13aa5848555f5512ac12155930fb4beb7d)                       |  318 |

I'll create a comprehensive "How to Use" section for your README that covers both standalone and Rails Action View usage, including SVG examples for each icon library. Here's how it could look:

## How to Use

### Standalone Usage

You can use Rubicons in any Ruby application without Rails. First, require the gem:

```ruby
require 'rubicons'
```

#### Using Lucide Icons

```ruby
# Get a simple icon with default options (medium size)
svg = Rubicons::Lucide.icon('heart')

# With custom size
svg = Rubicons::Lucide.icon('heart', size: :lg)

# With custom class
svg = Rubicons::Lucide.icon('heart', class: 'text-red-500')

# List all available icons
icon_names = Rubicons::Lucide.available_icons
```

This generates an SVG element:

```html
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"/></svg>
```

#### Using Radix Icons

```ruby
# Get a simple icon with default options
svg = Rubicons::Radix.icon('heart')

# With custom size
svg = Rubicons::Radix.icon('heart', size: :xl)

# With custom class
svg = Rubicons::Radix.icon('heart', class: 'icon-primary')

# List all available icons
icon_names = Rubicons::Radix.available_icons
```

This generates an SVG element:

```html
<svg width="24" height="24" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4.89346 2.35248C3.49195 2.35248 2.35248 3.49359 2.35248 4.90532C2.35248 6.38164 3.38046 7.61814 4.47057 8.5641C5.55704 9.50695 6.69248 10.1771 7.50002 10.6459C8.30757 10.1771 9.44302 9.50695 10.5295 8.5641C11.6196 7.61814 12.6476 6.38164 12.6476 4.90532C12.6476 3.49359 11.5081 2.35248 10.1066 2.35248C9.27059 2.35248 8.81894 2.64323 8.5397 2.95843C8.27877 3.25295 8.14623 3.58566 8.02501 3.88993L8.00064 3.94565C7.94202 4.09766 7.88485 4.24628 7.80625 4.36017C7.69262 4.52776 7.52197 4.70565 7.50002 4.70565C7.47807 4.70565 7.30742 4.52776 7.1938 4.36017C7.11519 4.24628 7.05802 4.09766 6.9994 3.94565L6.97504 3.88993C6.85381 3.58566 6.72127 3.25295 6.46034 2.95843C6.1811 2.64323 5.72945 2.35248 4.89346 2.35248Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
```

### Rails Integration

Rubicons comes with Rails view helpers that make it easy to use icons in your views.

#### Setup

The helpers are automatically included in your ActionView context. You don't need any additional setup beyond adding the gem to your Gemfile.

#### Using Lucide Icons in Views

```erb
<%# Basic icon %>
<%= lucide_icon('heart') %>

<%# With size options (xs, sm, md, lg, xl, 2xl) %>
<%= lucide_icon('heart', size: :lg) %>

<%# With custom class %>
<%= lucide_icon('heart', class: 'text-red-500 inline-block') %>
```

#### Using Radix Icons in Views

```erb
<%# Basic icon %>
<%= radix_icon('heart') %>

<%# With size options (xs, sm, md, lg, xl, 2xl) %>
<%= radix_icon('heart', size: :xl) %>

<%# With custom class %>
<%= radix_icon('heart', class: 'icon-primary inline-block') %>
```

### Available Sizes

Both icon libraries support these predefined sizes:

| Size | Dimensions (pixels) |
|------|---------------------|
| xs   | 12×12               |
| sm   | 16×16               |
| md   | 20×20 (default)     |
| lg   | 24×24               |
| xl   | 32×32               |
| 2xl  | 40×40               |

### Icon Usage Examples

You can use these icons anywhere HTML is supported:

```erb
<button class="btn btn-primary">
  <%= lucide_icon('save', size: :sm, class: 'mr-2') %>
  Save Changes
</button>

<div class="alert alert-info">
  <%= radix_icon('info', size: :lg, class: 'align-middle') %>
  <span>Please review the changes before continuing.</span>
</div>
```

For a complete list of available icons, visit:
- [Lucide Icons](https://lucide.dev/)
- [Radix Icons](https://www.radix-ui.com/icons)

## Contributing

1. Fork it ( https://github.com/insomnius/rubicons/fork )
2. Create your feature branch (git checkout -b feature/my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin feature/my-new-feature)
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.