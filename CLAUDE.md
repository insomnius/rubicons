# CLAUDE.md

Guidance for Claude Code when working in this repository.

## Project overview

**Rubicons** is a pure-Ruby SVG icon toolkit (RubyGem). It bundles SVG files from 23 popular icon libraries and exposes a uniform API to render them — optionally as Rails view helpers or Phlex helpers.

- Gem name: `rubicons`
- Current version: `lib/rubicons/version.rb`
- Ruby: see `.ruby-version`
- No JS / asset pipeline. Everything is server-side Ruby reading `.svg` files from disk and tweaking attributes via Nokogiri.

## Architecture

```
lib/rubicons.rb              # entry point — autoloads each icon set
lib/rubicons/base_icon_set.rb# shared SVG render logic (Nokogiri)
lib/rubicons/<set>.rb        # per-icon-set module (Lucide, Bootstrap, …)
lib/rubicons/<set>/rails_helper.rb  # per-set Rails view helper
lib/rubicons/railtie.rb      # auto-includes every RailsHelper into ActionView
lib/rubicons/phlex.rb        # same, but for Phlex
icons/<set>/*.svg            # raw vendored SVGs (NOT hand-edited — see Tasks)
tasks/icons/download_*.rake  # rake tasks that download/refresh each set
test/rubicons/<set>_test.rb  # minitest per set (only Lucide so far)
```

### Render flow

`Rubicons::Lucide.icon('heart', size: :lg, class: 'text-red-500')` →
`BaseIconSet.render_icon` → reads `icons/lucide/heart.svg` → parses with Nokogiri → sets `width`, `height`, `stroke`, `fill` from the icon set's class methods (`stroke_color`, `fill_color`) → applies user options → returns the SVG string.

### `icon` vs `icon!`

- `.icon(name, ...)` — rescues all exceptions and returns `''`. Safe for view templates so a missing icon never crashes a page.
- `.icon!(name, ...)` — propagates `ArgumentError` if the icon is missing.

This pattern is in `BaseIconSet.render_icon` / `render_icon!`. **Don't "fix" the bare `rescue` to be more specific without checking — it's deliberate.**

### Adding a new icon set

1. Add a download rake task in `tasks/icons/download_<set>.rake` (model after existing ones).
2. Create `lib/rubicons/<set>.rb` with `pack_name`, `pack_description`, `license`, `icon`, `icon!`, `available_icons`, `fill_color`, `stroke_color`, and `ICONS_PATH`.
3. Create `lib/rubicons/<set>/rails_helper.rb` exposing a `<set>_icon` and `<set>_icon!` method.
4. Register in `lib/rubicons.rb` (autoload), `lib/rubicons/railtie.rb` (require + include), **and** `lib/rubicons/phlex.rb` (require + include — easy to forget; missing requires here cause `NameError` on Phlex load).
5. Add an entry to the README table and to `download_all.rake`.

## Common commands

```bash
make gem            # build + install the gem locally
make push           # gem push the latest built gem to rubygems.org
make count_icons    # SVG counts per icon set
make sample_icons   # first 5 filenames per set

bundle exec rake -T                       # list rake tasks (icon download tasks live here)
bundle exec rake icons:download_all       # refresh every icon set from upstream
bundle exec rake icons:download_lucide    # one set

bundle exec rake test                     # full minitest suite
ruby -Ilib -Itest test/rubicons/lucide_test.rb   # single test file
```

If `bundle exec` fails with `Bundler::GemNotFound`, the locked Ruby version may not be installed locally — check `.ruby-version` against `mise list ruby` or `rbenv versions`.

## Conventions

- `# frozen_string_literal: true` at the top of every Ruby file.
- Icon set modules expose **class-level** methods (`class << self`) — not instances.
- `available_icons` is memoized with `@available_icons ||= …` because directory listing is cheap but not free.
- The README table is sorted alphabetically by icon library name.
- Rubocop config is in `.rubocop.yml`.

## Things to be careful about

- The `icons/` directory is huge (>30k SVGs). Avoid full-tree greps without `--exclude-dir=icons`, and never let an editor format/touch those files — they are vendored from upstream.
- `lib/rubicons/railtie.rb` and `lib/rubicons/phlex.rb` both maintain parallel require/include lists. Keep them in sync when adding or removing a set.
- `BaseIconSet.render_icon` sets the SVG's `stroke` and `fill` from the set's class methods. If the method returns `nil`, the attribute is **deleted** instead of overwritten — this preserves child-element colors on multi-color sets (Flat Color Icons, VS Code Icons). For sets where the SVG already carries the correct fill on each path (e.g. Simple Icons, Devicon), pick `'currentColor'` / `'none'` thoughtfully. If you find yourself wanting "preserve whatever the SVG already had on the root," return `nil`.
- Nokogiri quirk: `element[attr] = nil` does NOT delete the attribute — it sets it to an empty string. `BaseIconSet` works around this with explicit `delete` calls. If you ever simplify that block, keep this in mind.
