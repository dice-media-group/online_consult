Feature: User can go to meetings page
  As a user
  In order to book meeting time
  I would like to see a calendar

  Background:
    Given time is frozen at 2017-09-01
    And there is a meeting room
    And there is a user logged in
    And meeting is booked at "01 Sep 08:00"

  Scenario: User can navigate to calendar page
    Given I navigate to the meetings page
    Then I should see a calender
    And I should not see a calendar link "08:00" at 2017-09-01
    But I should see a calendar link "13:00" at 2017-09-01
