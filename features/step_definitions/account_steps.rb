Given(/^I am logged in$/) do
  visit new_user_session_path
  fill_in 'Email', with: member.user.email
  fill_in 'Password', with: password
  click_button 'Log in'
end

Given(/^I am not logged in$/) do
  # Nothing to do here really?
end

When(/^I enter my email address(?: as "([^"]*)")?$/) do |email|
  @email = email || @email
  fill_in 'Email', with: @email
end

When(/^I enter( and confirm)? my password$/) do |confirm|
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password if confirm
end

Then(/^I should be on the login page$/) do
  expect(page.current_path).to eq new_user_session_path
end

Then(/^I should be logged in$/) do
  expect(page).not_to have_content 'Log in'
end

Then(/^I should not be logged in$/) do
  expect(page).to have_content 'Log in'
end
