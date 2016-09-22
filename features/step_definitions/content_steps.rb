When(/^I click the "([^"]*)" link$/) do |link_text|
  click_link link_text
end

When(/^I click the "([^"]*)" button$/) do |button_text|
  click_button button_text
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content(content)
end
