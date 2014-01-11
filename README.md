# Middleman-Syntax

`middleman-syntax` is an extension for the [Middleman] static site generator that adds syntax highlighting via [Rouge](https://github.com/jayferd/rouge).

[![Gem Version](https://badge.fury.io/rb/middleman-syntax.png)][gem]
[![Build Status](https://travis-ci.org/middleman/middleman-syntax.png)][travis]
[![Dependency Status](https://gemnasium.com/middleman/middleman-syntax.png?travis)][gemnasium]
[![Code Quality](https://codeclimate.com/github/middleman/middleman-syntax.png)][codeclimate]

## Installation

If you're just getting started, install the `middleman` gem and generate a new project:

```bash
gem install middleman
middleman init MY_PROJECT
```

If you already have a Middleman project: Add `gem "middleman-syntax"` to your `Gemfile` and run `bundle install`.

**This plugin will not work on Ruby 1.8!** Rouge requires 1.9+, so we do too.

## Configuration

```ruby
activate :syntax
```

You can also pass options to Rouge:

```ruby
activate :syntax, :line_numbers => true
```

The full set of options can be seen on your preview server's `/__middleman/config/` page.

## Helper

The extension adds a new `code` helper to Middleman that you can use from your templates:

```erb
<% code("ruby") do %>
def my_cool_method(message)
  puts message
end
<% end %>
```

That'll produce syntax-highlighted HTML wrapped in `<pre class="highlight ruby">`.

## CSS

On a default (i.e. unstyled) Middleman project, it will appear as if `middleman-syntax` isn't working, since obviously no CSS has been applied to color your code. You can use any Pygments-compatible stylesheet to style your code.

You can also let Rouge generate some CSS for you by creating a new stylesheet with a `.css.erb` extension in your Middleman project, and then including:

```erb
<%= Rouge::Themes::ThankfulEyes.render(:scope => '.highlight') %>
```

Rouge has `ThankfulEyes`, `Colorful`, `Github`, `Base16`, `Base16::Solarized` (like Octopress), `Base16::Monokai`, and `Monokai` themes.

## Markdown

The extension also makes code blocks in Markdown produce highlighted code. Make sure you're using RedCarpet or Kramdown as your Markdown engine (in `config.rb`):

```ruby
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

## OR

set :markdown_engine, :kramdown
```

Now your Markdown will work just like it does [on GitHub](http://github.github.com/github-flavored-markdown/) - you can write something like this with Redcarpet:

<pre>
```ruby
def my_cool_method(message)
  puts message
end
```
</pre>

or with Kramdown:

<pre>
~~~ ruby
def my_cool_method(message)
  puts message
end
~~~
</pre>

## Haml

When using Haml, a `:code` filter is exposed for outputting highlighted code. Because Haml filters don't allow arguments, you must use a special comment to indicate the language of the code to be highlighted (or let Rouge guess):

```haml
#example
  :code
    # lang: ruby

    def foo
      puts 'bar'
    end
```

With the special `# lang: <language tag>` comment on the first line, the `:code` filter is just like calling the `code` helper, but without the indentation problems that Haml might otherwise have. However, if you prefer, you can use the `code` helper along with the `:preserve` filter, as explained below.

## Indentation Problems

Some templating languages, like Haml, will indent your HTML for you,
which will mess up code formatted in `<pre>` tags. When
using Haml, either use the `:code` filter (recommended), use the
[`:preserve`](http://haml.info/docs/yardoc/file.REFERENCE.html#preserve-filter)
filter, or add `set :haml, { ugly: true }` in your `config.rb` to turn off
Haml's automatic indentation.

Example of using `:preserve`:

```haml
- code('ruby') do
  :preserve
    def foo
      puts 'bar'
    end
```

## Community

The official community forum is available at: http://forum.middlemanapp.com

## Bug Reports

Github Issues are used for managing bug reports and feature requests. If you run into issues, please search the issues and submit new problems: https://github.com/middleman/middleman-syntax/issues

The best way to get quick responses to your issues and swift fixes to your bugs is to submit detailed bug reports, include test cases and respond to developer questions in a timely manner. Even better, if you know Ruby, you can submit [Pull Requests](https://help.github.com/articles/using-pull-requests) containing Cucumber Features which describe how your feature should work or exploit the bug you are submitting.

## How to Run Cucumber Tests

1. Checkout Repository: `git clone https://github.com/middleman/middleman-syntax.git`
2. Install Bundler: `gem install bundler`
3. Run `bundle install` inside the project root to install the gem dependencies.
4. Run test cases: `bundle exec rake test`

## Donate

[Click here to lend your support to Middleman](https://spacebox.io/s/4dXbHBorC3)

## License

Copyright (c) 2012-2013 Benjamin Hollis. MIT Licensed, see [LICENSE] for details.

[middleman]: http://middlemanapp.com
[gem]: https://rubygems.org/gems/middleman-syntax
[travis]: http://travis-ci.org/middleman/middleman-syntax
[gemnasium]: https://gemnasium.com/middleman/middleman-syntax
[codeclimate]: https://codeclimate.com/github/middleman/middleman-syntax
[LICENSE]: https://github.com/middleman/middleman-syntax/blob/master/LICENSE.md
