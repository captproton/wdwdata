Feature: Administer food
  So that I can manage foods
  As an admin
  I want to add, delete and edit foods

  Scenario: Adding a food
    Given there is no food with the name "Coca Cola"
    When I am on the foods list
    And I follow "New Food"
    And I fill in "Name" with "Coca Cola"
    And I press "Create Food"
    Then I should be on the food show page for "Coca Cola"
    And I should see "Food was successfully created."
    And I should see "Coca Cola"
    # And I should see "Back to Foods List"
    And I should see "Coca Cola" on the foods list

# Fails in cucumber, but rspec works fine
  Scenario: Adding a food with a duplicate name
    Given a food with the name "Sprite" and the description "Clearly refreshing."
    And I am on the foods list
    When I follow "New Food"
    And I fill in "Name" with "Sprite"
    And I fill in "Description" with "Clearly refreshing."
    And I press "Create Food"
    Then I should not see "Food was successfully created."

  Scenario: Adding a food without a name
    Given I am on the foods list
    When I follow "New Food"
    And I press "Create Food"
    Then I should not see "Food was successfully created."


  Scenario: Deleting a food
  Given a food with the name "Sprite" and the description "Clearly refreshing."
    And I am on the foods list
    When I follow "Show"
    And I press "Destroy"
    Then I should be on the foods list
    And I should see "Food has been successfully destroyed!"
    And I should not see "Sprite"

  Scenario: Editing the content of a food
	# Given a district with the permalink "magic-kingdom" and the name "Magic Kingdom"
	#   	And I am on the districts list
	#   	When I follow "Magic Kingdom"
    
	Given a food with the name "Sprite" and the description "Clearly refreshing."
    And I am on the foods list
	And I should see "Sprite" on the foods list
    # When I follow "Sprite"
    And I follow "Edit"
    And I fill in "Name" with "No more Coca Cola!"
    And I press "Update Food"
    And I should see "Food was successfully updated."
    And I should see "No more Coca Cola!"
    And I should see "No more Coca Cola!" on the foods list
