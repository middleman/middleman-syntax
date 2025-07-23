Feature: Lexer options configuration

  Scenario: Lexer options are passed to Rouge lexer
    Given a fixture app "test-app"
    And a file named "config.rb" with:
      """
      activate :syntax, :lexer_options => { :prompt => 'myshell>>>' }
      """
    And a file named "source/console_code.html.erb" with:
      """
      <% code("console") do %>
      myshell>>> echo "hello world"
      myshell>>> echo "test"
      <% end %>
      """
    And the Server is running
    When I go to "/console_code.html"
    Then I should see '<span class="gp">myshell&gt;&gt;&gt;</span>'
    And I should not see '<span class="o">&gt;&gt;</span>'