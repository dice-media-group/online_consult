Feature: Can log out of the site
  As a user
  In order to keep my information secure
  I should be able to log out of my account

  Background:
    Given There is a user with email "unicorn@test.com" and password "password" in our database
    And I am logged in as that user
    And I navigate to the index page

  Scenario: user can log out
    # When I click on "Sign out"
    When I follow image link "dropdown-toggle"
    And I should see the text "Logout"
    And I click on "Logout"
    Then I should be on the index page
    And I should see the text "Signed out successfully"
