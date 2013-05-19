# Middleman-Syntax

`middleman-syntax` is an extension for the [Middleman] static site generator that adds syntax highlighting via [Rouge](https://github.com/jayferd/rouge).

## Installation

If you're just getting started, install the `middleman` gem and generate a new project:

```
gem install middleman
middleman init MY_PROJECT
```

If you already have a Middleman project: Add `gem "middleman-syntax"` to your `Gemfile` and run `bundle install`

## Configuration

```
activate :syntax
```

You can also pass options to Rouge:

```
activate :syntax,
         :linenos => 'inline',
         :anchorlinenos => true,
         :linenostart => 2
```

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

Rouge has `ThankfulEyes`, `Colorful`, `Base16`, `Solarized` (like Octopress), and `Monokai` themes.

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

## Build & Dependency Status

[![Gem Version](https://badge.fury.io/rb/middleman-syntax.png)][gem]
[![Build Status](https://travis-ci.org/middleman/middleman-syntax.png)][travis]
[![Dependency Status](https://gemnasium.com/middleman/middleman-syntax.png?travis)][gemnasium]
[![Code Quality](https://codeclimate.com/github/middleman/middleman-syntax.png)][codeclimate]

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