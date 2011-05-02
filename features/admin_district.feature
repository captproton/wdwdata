Feature: Administer districts
  So that I can manage districts
  As an admin
  I want to add, delete and edit districts

  Scenario: Adding a district
    Given there is no district with the permalink "magic-kingdom"
    And I am on the districts list
    When I follow "Add District"
    And I fill in "Permalink" with "magic-kingdom"
    And I fill in "Name" with "Magic Kingdom"
    And I press "Create District"
    Then I should be on the district show page for "magic-kingdom"
    And I should see "District saved successfully!"
    And I should see "magic-kingdom"
    And I should see "Magic Kingdom"
    And I should see "Back to Districts List"
    And I should see "magic-kingdom" on the districts list

  Scenario: Adding a district with a duplicate permalink
    Given a district with the permalink "magic-kingdom" and the name "Magic Kingdom"
    And I am on the districts list
    When I follow "Add District"
    And I fill in "Permalink" with "magic-kingdom"
    And I fill in "Name" with "Magic Kingdom"
    And I press "Create District"
    And I should not see "District saved successfully!"

  Scenario: Adding a district without a permalink
    Given I am on the districts list
    When I follow "Add District"
    And I press "Create District"
    Then I should not see "District saved successfully!"

  Scenario: Adding a district without a name
    Given I am on the districts list
    When I follow "Add District"
    And I press "Create District"
    Then I should not see "District saved successfully!"

  Scenario: Deleting a district
  	Given a district with the permalink "magic-kingdom" and the name "Magic Kingdom"
    And I am on the districts list
    When I follow "Magic Kingdom"
    And I press "Destroy"
    Then I should be on the districts list
    And I should see "District has been successfully destroyed!"
    And I should not see "Magic Kingdom"

  Scenario: Editing the content of a district
  	Given a district with the permalink "magic-kingdom" and the name "Magic Kingdom"
    And I am on the districts list
    When I follow "Magic Kingdom"
    And I follow "Edit"
    And I fill in "Name" with "No more Magic Kingdom!"
    And I press "Update District"
    And I should see "Successfully updated district!"
    And I should see "No more Magic Kingdom!"
    And I should see "No more Magic Kingdom!" on the districts list
