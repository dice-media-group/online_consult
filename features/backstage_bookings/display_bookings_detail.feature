@wip
Feature: Host can go to backstage page
  As a host, Heather
  In order to book meeting time
  Heather would like to see a calendar

  Background:
    Given time is frozen at 2017-09-01
    And there is a meeting room
    And Heather is logged in
    And meeting is booked at "01 Sep 08:00"

  Scenario: Host can navigate to calendar page
    Given Heather navigates to the bookings page
    Then Heather should see a calender
    And Heather should not see a calendar link "08:00" at 2017-09-01
    But Heather should see a calendar link "13:00" at 2017-09-01
