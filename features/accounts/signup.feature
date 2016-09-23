Feature: Account signup
  As a new user
  I want to sign up for an account
  So that I can use the application

  Scenario: Signing up, confirming, and logging in for the first time
    Given I am not logged in
     When I visit the login page
      And I click the "Sign up" link
      And I enter my email address as "ripley@sula.co"
      And I enter and confirm my password
      And I click the "Sign up" button
     Then I should be on the home page
      And I should see "has been sent"
      And I should receive an email with the subject "Confirm your email address"

     When I open the email
      And I click the link in the email
     Then I should be on the login page
      And I should see "successfully confirmed"
      And I should not be logged in

     When I enter my email address
      And I enter my password
      And I click the "Log in" button
     Then I should be on the home page
      And I should be logged in
      And I should see "Logged in successfully"
