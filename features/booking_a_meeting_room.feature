@time
Feature: user should be able to book time in meeting room
  As a user
  In order to get my washing done
  I would like to be able to book a meeting time

  Background:
    Given time is frozen at 2017-09-01
    And there is a meeting room
    And there is a user logged in

  Scenario: User can book a meeting time
    Given user visits the booking page
    And I click on calendar link "01 Sep 08:00"
    Then I should see the text "You have a booking 01 Sep 08:00. Smell the rainbows!"

  Scenario: User tries to book a booked slot
    Given meeting is booked at "01 Sep 08:00"
    And user visits the booking page
    When I try to access booking link for "01 Sep 08:00"
    Then I should see the text "The meeting room is fully booked"

  Scenario: User tries to book 3 slots
    Given user visits the booking page
    And I click on calendar link "02 Sep 08:00"
    And I click on calendar link "04 Sep 13:00"
    And I click on calendar link "04 Sep 08:00"
    Then I should see the text "You may only have two active bookings."