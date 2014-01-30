Feature: Book

  Background:
	Given a shelf named "BDD"


  Scenario: Navigating from book listing page to the new book page
	Given I visit the book listing page
	When I click on the "New Book" link
	Then I should see the new book page


  Scenario: Creating a book
	Given I visit the new book page
 	When I fill in the Name field with "The RSpec Book"
	And I check "BDD" from the shelves list
	And I press the Save Book button
	Then I should see the book listing page
	And I should see "Book The RSpec Book was successfully created." success message


  Scenario: Submitting new book form without a name
	Given I visit the new book page
	When I check "BDD" from the shelves list
	And I press the Save Book button
	Then I should stay on the new book page
	And I should see "Name can't be blank" error message
	And "BDD" shelf should be checked