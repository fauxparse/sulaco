When(/^I visit the home page$/) do
  visit root_url
end

Then(/^I should be on the home page$/) do
  expect(page.current_path).to eq root_path
end
