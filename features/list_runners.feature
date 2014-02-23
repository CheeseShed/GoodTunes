Feature: Display the list of runners
  In order to see all the runners currently signed up on the site
  As a potential donator or runner
  I want to see a list of all runners
 
  Scenario: Display a list of all runners when javascript is off
    Given some runners in the collection
    When I visit the list of runners
    Then I see all runners

  @javascript
  Scenario: Display a list of all runners when javascript is on
    Given some runners in the collection
    When I visit the list of runners
    Then I see all runners