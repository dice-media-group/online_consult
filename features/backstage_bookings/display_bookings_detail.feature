@time
Feature: Host can go to backstage page
  As a host, Heather
  In order to book a meeting time
  Heather would like to see a calendar

  Background:
    Given time is frozen at 2017-09-01
    And there is a meeting room
    And Heather is logged in
    And meeting is booked at "01 Sep 08:00"

  Scenario: Host can navigate to calendar page
pending Given Heather visits the booking page
# Then she should see a calender
# And she should not see a calendar link "08:00" at 2017-09-01
# But she should see a calendar link "13:00" at 2017-09-01
