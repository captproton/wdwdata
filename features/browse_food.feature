Feature: Browse foods
  So that I can browse through the foods
  As a visitor
  I want to choose an food from a full list of foods and read it

  Scenario: Browsing a list of foods
  	Given a food with the name "Sprite" and the description "Clearly refreshing."
  	Given a food with the name "Beer" and the description "Clearly Unrefreshing."
    When I am on the foods list
    Then I should see "Sprite"
    And I should see "Beer"

  Scenario: Reading a food
	Given a food with the name "Sprite" and the description "Clearly refreshing."
    When I am on the foods list
    And I follow "Show"
    Then I should see "Sprite"
    And I should see "Back to Foods List"
