Feature: Scheduling

    Because scheduling is a huge functionality, this
    specification file describes only the most important
    high-level scenario.
    You can find more detailed scenarios in the rest
    of the files inside the "meetings" folder in the
    specification suite.

    Background:
        Given time is frozen at 2017-09-01
        And there is a meeting room
        And Heather is logged in

    # Scenario: Creating a meeting
    #   Given Heather, a host
    #   When Heather chooses 2 PM as a start time for her meeting
    #   Then she should be able to save her meeting

    Scenario: Host navigates from host dashboard to bookings
        Given Heather navigates to the backstage index page
        And she clicks on calendar link "01 Sep 08:00"
        Then she sees the text "01 Sep 08:00"

