Feature: Shelf

  In order to organize books
  As a user
  I want to create shelves


  Scenario: Navigating from shelf listing page to the new shelf page
	Given I visit the shelf listing page
	When I click on the "New Shelf" link
	Then I should see the new shelf page


  Scenario: Creating a shelf
	Given I visit the new shelf page
	When I fill in the Name field with "BDD"
	And I press the Save Shelf button
	Then I should see the shelf listing page
	And I should see "Shelf BDD was successfully created." success message
	And I should see "BDD" in the shelves


  Scenario: Submitting new shelf form without a name
	Given I visit the new shelf page
	When I press the Save Shelf button
	Then I should stay on the new shelf page
	And I should see "Name can't be blank" error message