class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
		@shelves = Shelf.all
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			flash[:notice] = 'Book ' + @book.name + ' was successfully created.'
			redirect_to books_url
		else
			@shelves = Shelf.all
			render :action => 'new'
		end
	end

	private

	def book_params
		params.require(:book).permit(:name, :shelf_ids => [])
	end

end
