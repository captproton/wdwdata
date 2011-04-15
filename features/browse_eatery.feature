Feature: Browse eateries
  So that I can browse through the eateries
  As a visitor
  I want to choose an eatery from a full list of eateries and read it

  Scenario: Browsing a list of eateries
    Given an eatery with the name "Casey's Corner"
    And an eatery with the name "Columbia Harbor House"
    When I am on the eateries page
    Then I should see "Casey's Corner"
    And I should see "Columbia Harbor House"

  Scenario: Reading an eatery
    Given an eatery with the name "Casey's Corner" and the permalink "caseys-corner"
    When I am on the eateries page
    And I follow "Casey's Corner"
    Then I should see "Casey's Corner"
    And I should see "caseys-corner"
    And I should see "Back to Eateries List"
