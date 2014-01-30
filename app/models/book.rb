class Book < ActiveRecord::Base

	has_many :book_shelves
	has_many :shelves, :through => :book_shelves

	validates_presence_of :name

end
