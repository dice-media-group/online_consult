Feature: A user can log in to to the site
  As a user
  In order to be able to do meeting
  I would like to be able to log in to MeetingTime

  Background:
    Given There is a user with email "unicorn@test.com" and password "password" in our database
    And I navigate to the index page

  Scenario: User provides valid credentials
    When I click on "Sign in"
    Then I fill in "Email" with "unicorn@test.com"
    And I fill in "Password" with "password"
    When I click on "Log in"
    Then I should see the text "Signed in successfully."
    And I should see the text "Logged in as: unicorn@test.com"

  Scenario: User provides wrong email
    When I click on "Sign in"
    Then I fill in "Email" with "EmbarrassedUnicorn@test.com"
    And I fill in "Password" with "password"
    When I click on "Log in"
    Then I should see the text "Invalid Email or password."

  Scenario: User provides wrong password
    When I click on "Sign in"
    Then I fill in "Email" with "unicorn@test.com"
    And I fill in "Password" with "PassWord"
    When I click on "Log in"
    Then I should see the text "Invalid Email or password."


