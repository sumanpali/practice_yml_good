Feature: reservation of a flight ticket one way

  Background:
    Given any user is on the expedia homapage
    And user clicks on oneway
  Scenario: reserving a flight with proper data
    And user enters valid departing airport
    And user enters valid arrivng airport
    And user enters valid date of departure
    And user enters on the valid number for adults
    And user clicks on search page
    Then user sees the results page