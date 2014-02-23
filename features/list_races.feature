Feature: Display the list of races
  In order to see all the marathons people are running
  As a potential donator or runner
  I want a page which displays all races that have been created
 
  Scenario: Display a list of all races when javascript is off
    Given some races in the collection
    When I visit the list of races
    Then I see all races

    Given some races in the collection
    When I visit the homepage
    Then I see all races

  @javascript
  Scenario: Display a list of all races when javascript is on
    Given some races in the collection
    When I visit the list of races
    Then I see all races

    Given some races in the collection
    When I visit the homepage
    Then I see all races