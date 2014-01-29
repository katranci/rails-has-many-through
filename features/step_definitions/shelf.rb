Given(/^I visit the shelf listing page$/) do
	visit shelves_path
end

When(/^I click on the "([^"]*)" link$/) do |link_text|
	click_on link_text
end

Then(/^I should see the new shelf page$/) do
	expect(current_path).to eq(new_shelf_path)
end

Given(/^I visit the new shelf page$/) do
	visit new_shelf_path
end

When(/^I fill in the (.*) field with "([^"]*)"$/) do |field, value|
	fill_in field, :with => value
end

And(/^I press the (.*) button$/) do |button_value|
	click_on button_value
end

Then(/^I should see the shelf listing page$/) do
	expect(current_path).to eq(shelves_path)
end

And(/^I should see "([^"]*)" success message$/) do |message|
	expect(page).to have_content(message)
end

And(/^I should see "([^"]*)" in the shelves$/) do |shelf_name|
	shelves = find('#shelves')
	expect(shelves).to have_content(shelf_name)
end