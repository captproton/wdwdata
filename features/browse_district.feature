Feature: Browse districts
  So that I can browse through the districts
  As a visitor
  I want to choose an district from a full list of districts and read it

  Scenario: Browsing a list of districts
  	Given an district with the permalink "magic-kingdom" and the name "Magic Kingdom"
    And an district with the permalink "epcot" and the name "Epcot"
    When I am on the districts page
    Then I should see "Magic Kingdom"
    And I should see "Epcot"

  Scenario: Reading an district
	Given an district with the permalink "magic-kingdom" and the name "Magic Kingdom"
    When I am on the districts list
    And I follow "Magic Kingdom"
    Then I should see "Magic Kingdom"
    And I should see "magic-kingdom"
    And I should see "Back to Districts List"
