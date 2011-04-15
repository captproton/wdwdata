Feature: Administer eateries
  So that I can manage eateries
  As an admin
  I want to add, delete and edit eateries

  Scenario: Adding an eatery
    Given there is no eatery with the permalink "caseys-corner"
    And I am on the eateries list
    When I follow "Add Eatery"
    And I fill in "Permalink" with "caseys-corner"
    And I fill in "Name" with "Casey's Corner"
    And I press "Create Eatery"
    Then I should be on the eatery show page for "caseys-corner"
    And I should see "Eatery saved successfully!"
    And I should see "caseys-corner"
    And I should see "Casey's Corner"
    And I should see "Back to Eateries List"
    And I should see "caseys-corner" on the eateries list

  Scenario: Adding an eatery with a duplicate permalink
    Given an eatery with the permalink "caseys-corner" and the name "Casey's Corner"
    And I am on the eateries list
    When I follow "Add Eatery"
    And I fill in "Permalink" with "caseys-corner"
    And I fill in "Name" with "Casey's Corner"
    And I press "Create Eatery"
    And I should not see "Eatery saved successfully!"

  Scenario: Adding an eatery without a permalink
    Given I am on the eateries list
    When I follow "Add Eatery"
    And I press "Create Eatery"
    Then I should not see "Eatery saved successfully!"

  Scenario: Adding an eatery without a name
    Given I am on the eateries list
    When I follow "Add Eatery"
    And I press "Create Eatery"
    Then I should not see "Eatery saved successfully!"

  Scenario: Deleting an eatery
  	Given an eatery with the permalink "caseys-corner" and the name "Casey's Corner"
    And I am on the eateries list
    When I follow "Casey's Corner"
    And I press "Destroy"
    Then I should be on the eateries list
    And I should see "Eatery has been successfully destroyed!"
    And I should not see "Casey's Corner"

  Scenario: Editing the content of an eatery
  	Given an eatery with the permalink "caseys-corner" and the name "Casey's Corner"
    And I am on the eateries list
    When I follow "Casey's Corner"
    And I follow "Edit"
    And I fill in "Name" with "No more Casey's Corner!"
    And I press "Update Eatery"
    And I should see "Successfully updated eatery!"
    And I should see "No more Casey's Corner!"
    And I should see "No more Casey's Corner!" on the eateries list
