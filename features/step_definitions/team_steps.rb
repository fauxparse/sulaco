Given(/^the "([^"]*)" team exists$/) do |name|
  team(name: name)
end

Given(/^I am a team manager$/) do
  manager(team: team).user.confirm
end

When(/^I visit the team page$/) do
  visit url_for(team)
end

When(/^I fill in the following members:$/) do |table|
  table.hashes.each.with_index do |row, i|
    row.each_pair do |field, value|
      fill_in "members[#{i}][#{field}]", with: value unless value.blank?
    end
  end
end

Then(/^I should be on the edit members page$/) do
  expect(page.current_path).to eq team_members_path(team)
end

Then(/^I should be on the team page$/) do
  expect(page.current_path).to eq team_path(team)
end
