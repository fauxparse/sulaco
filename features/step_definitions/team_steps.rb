Given(/^the "([^"]*)" team exists$/) do |name|
  team(name: name)
end

Given(/^I am a team manager$/) do
  manager.user.confirm
end

Given(/^I am logged in$/) do
  visit new_user_session_path
  fill_in 'Email', with: member.user.email
  fill_in 'Password', with: password
  click_button 'Log in'
end

When(/^I visit the team page$/) do
  visit url_for(team)
end

Then(/^I should be on the edit members page$/) do
  expect(page.current_path).to eq team_members_path(team)
end
