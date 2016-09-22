Given(/^the "([^"]*)" team exists$/) do |name|
  @team = FactoryGirl.create(:team, name: name)
end

Given(/^I am a team manager$/) do
  @member = FactoryGirl.create(:manager, team: @team)
end

Given(/^I am logged in$/) do
  # TODO: implement login
end

When(/^I visit the team page$/) do
  visit url_for(@team)
end

Then(/^I should be on the edit members page$/) do
  expect(page.current_path).to eq team_members_path(@team)
end
