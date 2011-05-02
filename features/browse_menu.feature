Feature: Browse menus
  So that I can browse through the menus
  As a visitor
  I want to choose a menu from a full list of menus and read it

  Scenario: Browsing a list of menus

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

  When I follow "Add Menu"
  And I fill in "Name" with "Child Lunch Menu"
  And I press "Create Menu"
  # Then I should be on the menu show page for "Adult Lunch Menu"
  # And I should see "Menu saved successfully!"
  And I should see "Adult Lunch Menu"
  And I should see "Child Lunch Menu"
  And I should see "Add Menu"


  Scenario: Reading a menu
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

    And I follow "Adult Lunch Menu"
    Then I should see "Adult Lunch Menu"
    And I should see "Back to Menus List"
