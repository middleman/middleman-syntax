2.0.0 (master)
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
