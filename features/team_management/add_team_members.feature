Feature: Add team members
  As a team manager
  I want to add members to my team
  So that I have a team to manage

  Scenario: Add new team members
    Given the "Sulaco" team exists
      And I am a team manager
      And I am logged in
     When I visit the team page
      And I click the "Edit members" link
      And I click the "Add members" link
      And I fill in the following members:
        | name    |
        | Vasquez |
      And I click the "Invite members" button
     Then I should be on the edit members page
      And I should see "Vasquez"
