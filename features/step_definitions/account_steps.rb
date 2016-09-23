Given(/^I am logged in$/) do
  visit new_user_session_path
  fill_in 'Email', with: member.user.email
  fill_in 'Password', with: password
  click_button 'Log in'
end

Given(/^I am not logged in$/) do
  # Nothing to do here really?
end

Given(/^a user exists with the email "([^"]*)"$/) do |email|
  FactoryGirl.create(:user, email: email).confirm
end

When(/^I enter my email address(?: as "([^"]*)")?$/) do |email|
  @email = email || @email
  fill_in 'Email', with: @email
end

When(/^I enter( and confirm)? my password$/) do |confirm|
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password if confirm
end

When(/^I visit the login page$/) do
  visit new_user_session_path
end

When(/^I log out$/) do
  click_link 'Log out'
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
