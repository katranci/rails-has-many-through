require 'spec_helper'

describe BooksController do

	describe "GET #new" do
		it "creates a new Book" do
			expect(Book).to receive(:new)
			get :new
		end
		it "assigns @book" do
			get :new
			expect(assigns[:book]).to be_a_new(Book)
		end
		it "retrieves all the shelves" do
			expect(Shelf).to receive(:all)
			get :new
		end
		it "assigns @shelves" do
			shelves = double('shelves')
			Shelf.stub(:all).and_return(shelves)
			get :new
			expect(assigns[:shelves]).to eq(shelves)
		end
		it "renders the :new template" do
			get :new
			expect(response).to render_template(:new)
		end
	end

	describe "GET #index" do
		it "retrieves all the books" do
			expect(Book).to receive(:all)
			get :index
		end
		it "assigns @books" do
			books = double('books')
			Book.stub(:all).and_return(books)
			get :index
			expect(assigns[:books]).to eq(books)
		end
		it "renders the :index template" do
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe "POST #create" do

		let(:request_hash) do
			{ book: {
					name: 'The RSpec Book',
					shelf_ids: [111, 222, 333]}
			}
		end

		let(:book) { double(:book).as_null_object }

		before(:each) do
			Book.stub(:new).and_return(book)
		end

		it "creates a Book" do
			expect(Book).to receive(:new).with(
				'name' => 'The RSpec Book',
				'shelf_ids' => ['111', '222', '333'])
			post :create, request_hash
		end
		it "saves the book" do
			expect(book).to receive(:save)
			post :create, request_hash
		end

		context "when book saves successfully" do
			it "sets a flash[:notice]" do
				post :create, request_hash
				expect(flash[:notice]).to_not be_nil
			end
			it "redirects to books#index" do
				post :create, request_hash
				expect(response).to redirect_to(books_url)
			end
		end

		context "when book fails to save" do

			before(:each) do
				book.stub(:save).and_return(false)
			end

			it "assigns @book" do
				post :create, request_hash
				expect(assigns[:book]).to eq(book)
			end
			it "retrieves all the shelves" do
				expect(Shelf).to receive(:all)
				post :create, request_hash
			end
			it "assigns @shelves" do
				shelves = double('shelves')
				Shelf.stub(:all).and_return(shelves)
				post :create, request_hash
				expect(assigns[:shelves]).to eq(shelves)
			end
			it "re-renders the :new template" do
				post :create, request_hash
				expect(response).to render_template(:new)
			end
		end
	end

end
