Feature: Syntax highlighting with the "code" helper method

  Scenario: Works from ERb
    Given the Server is running at "test-app"
    When I go to "/code_html.html"
    Then I should see '<span class="k">def</span>'
    Then I should see '<pre class="highlight plaintext">This is some code'
