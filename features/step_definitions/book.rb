Given(/^I visit the book listing page$/) do
	visit books_path
end

Then(/^I should see the new book page$/) do
	expect(current_path).to eq(new_book_path)
end

Given(/^I visit the new book page$/) do
	visit new_book_path
end

Given(/^a shelf named "([^"]*)"$/) do |shelf_name|
	Shelf.create!(name: shelf_name)
end

And(/^I check "([^"]*)" from the shelves list$/) do |shelf_name|
	check shelf_name
end

Then(/^I should see the book listing page$/) do
	expect(current_path).to eq(books_path)
end

And(/^I should see "([^"]*)" in the books$/) do |book_name|
	books = find('#books')
	expect(books).to have_content(book_name)
end

Then(/^I should stay on the new book page$/) do
end

And(/^"([^"]*)" shelf should be checked$/) do |shelf_name|
	expect(field_labeled(shelf_name)).to be_checked
end

And(/^the (.*) field should be pre-filled with "([^"]*)"$/) do |field, value|
	expect(field_labeled(field).value).to eq(value)
end