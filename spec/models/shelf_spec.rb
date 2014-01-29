require 'spec_helper'

describe Shelf do

	it "is valid with a name" do
		shelf = Shelf.new(name: 'CSS')
		expect(shelf).to be_valid
	end

	it "is invalid without a name" do
		shelf = Shelf.new
		expect(shelf).to have(1).errors_on(:name)
	end

end
