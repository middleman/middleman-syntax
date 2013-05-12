# middleman-syntax

middleman-syntax is an extension for the [Middleman](http://middlemanapp.com) static site generator that adds syntax highlighting via [Rouge](https://github.com/jayferd/rouge).

# Install
If you're just getting started, install the `middleman` gem and generate a new project:

```
gem install middleman
middleman init MY_PROJECT
```

If you already have a Middleman project:
Add `middleman-syntax` to your `Gemfile`, run `bundle install`, then open your `config.rb` and add:

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

# Helper

The extension adds a new `code` helper to Middleman that you can use from your templates:

```erb
<% code("ruby") do %>
def my_cool_method(message)
  puts message
end
<% end %>
```

That'll produce syntax-highlighted HTML wrapped in a `<pre>` tag, wrapped in `<div class="highlight ruby">`.

# CSS

On a default (i.e. unstyled) Middleman project, it will appear as if `middleman-syntax` isn't working, since obviously no CSS has been applied to color your code. You can use any Pygments-compatible stylesheet to style your code.

You can also let Rouge generate some CSS for you by creating a new stylesheet with a `.css.erb` extension in your Middleman project, and then including:

```erb
<%= Rouge::Themes::ThankfulEyes.render(:scope => '.highlight') %>
```

Rouge has `ThankfulEyes`, `Colorful`, `Base16`, `Solarized` (like Octopress), and `Monokai` themes.

# Markdown

The extension also makes code blocks in Markdown produce highlighted code. Make sure you're using RedCarpet or Kramdown as your Markdown engine (in `config.rb`):

```ruby
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# OR

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

# Bug Reports

GitHub Issues are used for managing bug reports and feature requests. If you run into issues, please search the issues and submit new problems:

https://github.com/middleman/middleman-syntax/issues

The best way to get quick responses to your issues and swift fixes to your bugs is to submit detailed bug reports, include test cases and respond to developer questions in a timely manner. Even better, if you know Ruby, you can submit Pull Requests containing Cucumber Features which describe how your feature should work or exploit the bug you are submitting.
