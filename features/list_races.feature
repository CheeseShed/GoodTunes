Feature: Display the list of races
  In order to see all the races currently live on the site
  As a potential donator or runner
  I want to see a list of all races
 
  Scenario: Display a list of all races
    Given some races in the collection
    When I visit the list of races
    Then I see all races