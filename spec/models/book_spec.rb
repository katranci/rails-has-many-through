require 'spec_helper'

describe Book do

	it "is valid with a name, and a shelf" do
		shelf = Shelf.create!(name: 'BDD')
		book = Book.new(name: 'The RSpec Book', shelf_ids: [shelf.id])
		expect(book).to be_valid
	end

	it "is invalid without a name" do
		book = Book.new
		expect(book).to have(1).errors_on(:name)
	end

end
