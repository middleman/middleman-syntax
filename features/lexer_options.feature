Feature: Lexer options
  @nojava
  Scenario: Start inline option enabled
    Given a fixture app "test-app"
    And a file named "config.rb" with:
      """
      set :markdown_engine, :redcarpet
      set :markdown, fenced_code_blocks: true
      activate :syntax, lexer_options: { start_inline: true }
      """
    Given the Server is running at "test-app"
    When I go to "/lexer_options.html"
    Then I should see '<span class="nv">$var</span>'
    And I should see '<span class="nv">$var2</span>'
