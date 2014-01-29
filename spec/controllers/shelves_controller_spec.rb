require 'spec_helper'

describe ShelvesController do

	describe "GET #new" do
		it "creates a new Shelf" do
			expect(Shelf).to receive(:new)
			get :new
		end
		it "assigns @shelf" do
			get :new
			expect(assigns[:shelf]).to be_a_new(Shelf)
		end
		it "renders the :new template" do
			get :new
			expect(response).to render_template(:new)
		end
	end

	describe "GET #index" do
		it "retrieves all the shelves" do
			expect(Shelf).to receive(:all)
			get :index
		end
		it "assigns @shelves" do
			shelves = double('shelves')
			Shelf.stub(:all).and_return(shelves)
			get :index
			expect(assigns[:shelves]).to eq(shelves)
		end
		it "renders the :index template" do
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe "POST #create" do

		let(:request_hash) do
			{ shelf: { name: 'RoR' }}
		end

		let(:shelf) { double(:shelf).as_null_object }

		before(:each) do
			Shelf.stub(:new).and_return(shelf)
		end

		it "creates a Shelf" do
			expect(Shelf).to receive(:new).with('name' => 'RoR')
			post :create, request_hash
		end
		it "saves the shelf" do
			expect(shelf).to receive(:save)
			post :create, request_hash
		end

		context "when shelf saves successfully" do
			it "sets a flash[:notice]" do
				post :create, request_hash
				expect(flash[:notice]).to_not be_nil
			end
			it "redirects to shelves#index" do
				post :create, request_hash
				expect(response).to redirect_to(shelves_url)
			end
		end

		context "when shelf fails to save" do

			before(:each) do
				shelf.stub(:save).and_return(false)
			end

			it "assigns @shelf" do
				post :create, request_hash
				expect(assigns[:shelf]).to eq(shelf)
			end
			it "re-renders the :new template" do
				post :create, request_hash
				expect(response).to render_template(:new)
			end
		end
	end

end
