Feature: Administer menus
  So that I can manage menus
  As an admin
  I want to add, delete and edit menus

  Scenario: Adding a menu
	Given an eatery with the permalink "caseys-corner" and the name "Casey's Corner"
  	When I am on the eateries list
  	And I follow "Casey's Corner"
  	Then I should see "Casey's Corner"
  	And I should see "caseys-corner"
  	And I should see "Back to Eateries List"

	When I follow "Menus"
	Then I should see "Casey's Corner Menus"
    When I follow "Add Menu"
    And I fill in "Name" with "Adult Lunch Menu"
    And I press "Create Menu"
    # Then I should be on the menu show page for "Adult Lunch Menu"
    # And I should see "Menu saved successfully!"
    And I should see "Adult Lunch Menu"
    And I should see "Add Menu"

  Scenario: Adding a menu without a name
	Given an eatery with the permalink "caseys-corner" and the name "Casey's Corner"
	When I am on the eateries list
	And I follow "Casey's Corner"
	Then I should see "Casey's Corner"
	And I should see "caseys-corner"
	And I should see "Back to Eateries List"

	When I follow "Menus"
	Then I should see "Casey's Corner Menus"

    When I follow "Add Menu"
    And I press "Create Menu"
    Then I should not see "Menu saved successfully!"

  Scenario: Deleting a menu
	# Manuver to menu to delete
	Given an eatery with the permalink "caseys-corner" and the name "Casey's Corner"
	When I am on the eateries list
	# drill down to menus
	And I follow "Casey's Corner"
	Then I should see "Casey's Corner"
	And I should see "caseys-corner"
	And I should see "Back to Eateries List"
	# show menu list
	When I follow "Menus"
	Then I should see "Casey's Corner Menus"
    When I follow "Add Menu"
    And I fill in "Name" with "Adult Lunch Menu"
    And I press "Create Menu"
    # Then I should be on the menu show page for "Adult Lunch Menu"
    # And I should see "Menu saved successfully!"
    And I should see "Adult Lunch Menu"
    And I should see "Add Menu"

    When I follow "Adult Lunch Menu"
	And I should see "Adult Lunch Menu"
	 # Attempt to delete menu
    And I press "Destroy"
    # Then I should be on the menus list
    And I should see "Menu has been successfully destroyed!"
    And I should not see "Adult Lunch Menu"

  Scenario: Editing the content of a menu
	Given an eatery with the permalink "caseys-corner" and the name "Casey's Corner"
	When I am on the eateries list
	# drill down to menus
	And I follow "Casey's Corner"
	Then I should see "Casey's Corner"
	And I should see "caseys-corner"
	And I should see "Back to Eateries List"
	# show menu list
	When I follow "Menus"
	Then I should see "Casey's Corner Menus"
    When I follow "Add Menu"
    And I fill in "Name" with "Adult Lunch Menu"
    And I press "Create Menu"
    # Then I should be on the menu show page for "Adult Lunch Menu"
    # And I should see "Menu saved successfully!"
    And I should see "Adult Lunch Menu"
    And I should see "Add Menu"

    When I follow "Adult Lunch Menu"
    And I follow "Edit"
	And I should see "Editing menu"
    And I fill in "Name" with "No more Adult Lunch Menu!"
    And I press "Update Menu"
    # And I should see "Successfully updated menu!"
	And I should see "Casey's Corner Menus"
    And I should see "No more Adult Lunch Menu!"