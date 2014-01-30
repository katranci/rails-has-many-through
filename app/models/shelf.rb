class Shelf < ActiveRecord::Base

	has_many :book_shelves
	has_many :books, :through => :book_shelves

	validates_presence_of :name

end
