Feature: Host can go to landing page
    As a host
    In order to book meeting time
    I would like to be able to go to the index page of backstage for MeetingTime

    Scenario:
        Given I navigate to the index page of backstage
        Then I should see the text "Welcome"
