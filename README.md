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

## Usage

### Standalone

Once installed, you can use the `rubicons` gem in your Ruby application. Here’s a simple example of how to use it:

```ruby
require 'rubicons'

Rubicons::Lucide.icon('heart')
```

### Rails

If you are using Rails, you can include the `rubicons` gem in your application by adding it to your Gemfile:

```ruby
gem 'rubicons'
```

Then, run the following command to install the gem:

```bash
$ bundle install
```
After that, you can use the `rubicons` gem in your Rails application. Here’s an example of how to use it in a Rails view:

```erb
<%= lucide_icon('heart') %>
```

## Icons

The `rubicons` gem provides a collection of icons from various libraries. Below is a list of the available icon libraries along with their licenses, versions, and icon counts.

| Icon Library                                                            | License                                                                                           | Version                                  | Count |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------- | ----: |
| [Lucide](https://lucide.dev/)                                           | [ISC](https://github.com/lucide-icons/lucide/blob/main/LICENSE)                                   | [ed733916f30f34fb7815d76e286d9d097d73aa6b](https://github.com/lucide-icons/lucide/commit/ed733916f30f34fb7815d76e286d9d097d73aa6b)                       |  1565 |
| [Radix Icons](https://www.radix-ui.com/icons)                                           | [MIT](https://github.com/radix-ui/icons/blob/master/LICENSE)                                   | [bde33b13aa5848555f5512ac12155930fb4beb7d](https://github.com/radix-ui/icons/commit/bde33b13aa5848555f5512ac12155930fb4beb7d)                       |  318 |

## Contributing

1. Fork it ( https://github.com/insomnius/rubicons/fork )
2. Create your feature branch (git checkout -b feature/my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin feature/my-new-feature)
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.