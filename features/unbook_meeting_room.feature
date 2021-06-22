Feature: user should be able to unbook time in meeting room
  As a user
  In order to cancel my meeting time
  I would like to be able to unbook a meeting time

  Background:
    Given time is frozen at 2017-09-01
    And there is a meeting room
    And there is a user logged in

  Scenario: User can unbook a meeting time
    Given user visits the booking page
    And I click on calendar link "01 Sep 08:00"
    And I click on "Unbook"
    And I should see the text "You have successfully cancelled your booking."
    And I click on calendar link "01 Sep 08:00"
    Then I should see the text "You have a booking 01 Sep 08:00. Smell the rainbows!"
