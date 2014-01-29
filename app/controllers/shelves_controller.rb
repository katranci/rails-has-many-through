class ShelvesController < ApplicationController

	def index
		@shelves = Shelf.all
	end

	def new
		@shelf = Shelf.new
	end

	def create
		@shelf = Shelf.new(shelf_params)
		if @shelf.save
			flash[:notice] = 'Shelf ' + @shelf.name + ' was successfully created.'
			redirect_to shelves_url
		else
			render :action => 'new'
		end
	end

	private

		def shelf_params
			params.require(:shelf).permit(:name)
		end

end
