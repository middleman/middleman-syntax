# middleman-syntax

middleman-syntax is an extension for the [Middleman](http://middlemanapp.com) static site generator that adds syntax highlighting via [Pygments](http://pygments.org/).

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

# Usage

The extension adds a new `code` helper to Middleman that you can use from your templates:

```erb
<% code("ruby") do %>
def my_cool_method(message)
  puts message
end
<% end %>
```

That'll produce syntax-highlighted HTML wrapped in a `<pre>` tag, wrapped in `<div class="hightlight">`. You can style this with any CSS that works on Pygments output.

The extension also makes code blocks in Markdown highlight code. Make sure you're using RedCarpet as your Markdown engine (in `config.rb`):

```ruby
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true
```

Now your Markdown will work just like it does [on GitHub](http://github.github.com/github-flavored-markdown/) - you can write something like this:

<pre>
```ruby
def my_cool_method(message)
  puts message
end
```
</pre>

# Bug Reports

GitHub Issues are used for managing bug reports and feature requests. If you run into issues, please search the issues and submit new problems:

https://github.com/middleman/middleman-syntax/issues

The best way to get quick responses to your issues and swift fixes to your bugs is to submit detailed bug reports, include test cases and respond to developer questions in a timely manner. Even better, if you know Ruby, you can submit Pull Requests containing Cucumber Features which describe how your feature should work or exploit the bug you are submitting.