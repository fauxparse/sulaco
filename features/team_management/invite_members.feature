Feature: Invite new members
  As a team manager
  I want to invite new members to my team
  So they can take an active part in the process

  Scenario: Invite an existing user
    Given the "Sulaco" team exists
      And a user exists with the email "vasquez@sula.co"
      And I am a team manager
      And I am logged in
     When I visit the team page
      And I click the "Edit members" link
      And I click the "Add members" link
      And I fill in the following members:
        | name    | email           |
        | Vasquez | vasquez@sula.co |
      And I click the "Invite" button
     Then I should be on the edit members page
      And I should see "Added 1 member"
      And "vasquez@sula.co" should receive an email with the subject /invited/

     When I log out
      And I open the email with the subject /invited/
      And I click the link in the email
     Then I should be on the login page

     When I enter my email address as "vasquez@sula.co"
      And I enter my password
      And I click the "Log in" button
     Then I should be on the team page
      And I should see "Welcome"
      And I should be logged in

  Scenario: Invite a new user
    Given the "Sulaco" team exists
      And I am a team manager
      And I am logged in
     When I visit the team page
      And I click the "Edit members" link
      And I click the "Add members" link
      And I fill in the following members:
        | name    | email           |
        | Vasquez | vasquez@sula.co |
      And I click the "Invite" button
     Then I should be on the edit members page
      And I should see "Added 1 member"
      And "vasquez@sula.co" should receive an email with the subject /invited/

     When I log out
      And I open the email with the subject /invited/
      And I click the link in the email
     Then I should be on the login page

     When I click the "Sign up" link
      And I enter my email address as "vasquez@sula.co"
      And I enter and confirm my password
      And I click the "Sign up" button
     Then I should be on the team page
      And I should be logged in
