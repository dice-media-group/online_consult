@time
Feature: Host can see a list of their meeting bookings
  As a host
  In order to go to a meeting
  I would like to be able to see when I have booked time

  Background:
    Given time is frozen at 2017-09-01
    And there is a meeting room
    And Heather is logged in

  Scenario: Host sees her meeting time
    Given Heather visits the booking page
    And she clicks on calendar link "01 Sep 08:00"
    Then she sees the text "01 Sep 08:00"

  Scenario: Host don't have any bookings
    Given Heather visits the booking page
    Then I should see the text "You don't have any bookings yet."

  Scenario: Host should not see passed bookings
    Given Heather visits the booking page
    And I click on calendar link "01 Sep 08:00"
    And time is frozen at 2017-09-02
    And Heather visits the booking page
    And Heather should not see the text "01 Sep 08:00"
