# step definition for testing line number markup
Then(/^I should not see line numbers markup$/) do
  expect(page).not_to have_selector("pre.lineno")
end

# step definition for testing that specific content is not present
Then(/^I should not see "([^"]*)"$/) do |content|
  expect(page.body).not_to include(content)
end

# step definition for testing that specific content is not present (new format)
Then('I should not see {string}') do |content|
  expect(page.body).not_to include(content)
end
