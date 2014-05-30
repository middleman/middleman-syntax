2.1.0 (master)
-----

* Breaking: Code blocks are now also wrapped in a \<code> tag, which is consistent with Redcarpet and other markdown processors ([see the HTML5 spec](http://www.w3.org/TR/2011/WD-html5-author-20110809/the-code-element.html)).
* Strings can now be passed to `:inline_theme` for convenience.
* Added new `monokai.sublime` theme, designed to match Sublime Text's default theme.
* Added `:start_line` option to configure the starting index used for line numbers.
* Fixed bugs with `:css_class` where `false` was coerced into a string and blank spaces were sometimes added
* Prevented adding an empty class attribute if the `:css_class` option is empty/nil/false
* If the `:css_class` ends with a dash it will now be concatenated to the language tag. This means you can use the `language-#{lang}` prefix suggested in [the HTML5 spec](http://www.w3.org/TR/2011/WD-html5-author-20110809/the-code-element.html).

2.0.0
-----

* Update to a new-style Middleman extension, dropping compatibility with Middleman versions older than 3.2.x.
* Setting the :css_class option will no longer prevent the language tag from being added as a class as well.
* Rouge lexer options should now be set via the :lexer_options option.
* It is now possible to override options when calling the `code` helper by passing them as the second argument.
* Using the `code` helper from Slim templates no longer escapes the output.
* Added a `:code` filter for Haml as a more whitespace-friendly alternative to the `code` helper.

1.2.1
-----

* Restore compatibility with Middleman 3.0.x series.

1.2.0
-----

* Support Kramdown as Markdown engine in addition to Redcarpet.
* Switch to Rouge from Pygments.rb
* Fix bugs around setting language options.

1.1.1
-----

* Properly merge language attribute for Markdown. #14

1.1.0
-----

* Avoid errors when language is empty. #9
* Allow passing options to Pygments. #5 & #7

1.0.1
-----

* Updated pygments.rb dependency.

1.0.0
-----

* Initial release, basic syntax highlighting.
