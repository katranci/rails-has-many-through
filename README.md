Books & Shelves
===============
Demonstrates an association between books and shelves with the following behaviour:

```
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
```

```
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

  Scenario: Submitting new book form without a shelf
		Given I visit the new book page
		When I fill in the Name field with "The RSpec Book"
		And I press the Save Book button
		Then I should stay on the new book page
		And I should see "Shelves can't be blank" error message
		And the Name field should be pre-filled with "The RSpec Book"
```

Installation
------------
1. `$ bundle install`
2. `$ bundle exec rake db:migrate`
3. `$ rails s`

Routes
------
* http://localhost:3000/shelves
* http://localhost:3000/books
  
Running Tests
-------------
1. `$ bundle exec rake db:test:prepare`
2. `$ bundle exec rspec`
3. `$ bundle exec cucumber`

Contribute
----------
Please fill free to fork this repository and create more examples of has_many :through association.