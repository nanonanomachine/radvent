require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do
	describe "GET #show" do
		before :each do
			today = Date.new(2015, 12, 2)
			allow(Time.zone).to receive(:today).and_return(today)
		end

		it "redirects to root if requested item's date doesn't come yet" do
			item = create(:advent_calendar_item, date: 2).item
			today = Date.new(2014, 12, 3)
			allow(Time.zone).to receive(:today).and_return(today)
			get :show, id: item
			expect(response).to redirect_to root_path
		end

		it "assigns the requested item to @item" do
			item = create(:advent_calendar_item, date: 1).item
			get :show, id: item
			expect(assigns(:item)).to eq item
		end

		it "assigns previous AdventCalendarItem to @advent_calendar_item_prev" do
			advent_calendar_item_prev = create(:advent_calendar_item, date: 1)
			item = create(:advent_calendar_item, date: 2).item
			get :show, id: item
			expect(assigns(:advent_calendar_item_prev)).to eq advent_calendar_item_prev
		end

		it "assigns nil to @advent_calendar_item_prev if previous AdventCalendarItem is not exist" do
			item = create(:advent_calendar_item, date: 2).item
			get :show, id: item
			expect(assigns(:advent_calendar_item_prev)).to be_nil
		end

		it "assigns next AdventCalendarItem to @advent_calendar_item_next" do
			advent_calendar_item_next = create(:advent_calendar_item, date:2)
			item = create(:advent_calendar_item, date: 1).item
			get :show, id: item
			expect(assigns(:advent_calendar_item_next)).to eq advent_calendar_item_next
		end

		it "assigns nil to @advent_calendar_item_next if next AdventCalendarItem is not exist" do
			item = create(:advent_calendar_item, date: 1).item
			get :show, id: item
			expect(assigns(:advent_calendar_item_next)).to be_nil
		end

		it "renders the :show template if item's date is passed" do
			item = create(:advent_calendar_item, date: 1).item
			today = Date.new(2016, 11, 2)
			allow(Time.zone).to receive(:today).and_return(today)
			get :show, id: item
			expect(response).to render_template :show
		end
	end

	describe "GET #new" do
		it "assigns the requested date to @date" do
			get :new, date: 1
			expect(assigns(:date)).to eq "1"
		end

		it "assigns a new Item to @item" do
			get :new
			expect(assigns(:item)).to be_a_new(Item)
		end

		it "assigns the requested id to @item.advent_calendar_item_id" do
			get :new, id: 1
			expect(assigns(:item).advent_calendar_item_id).to eq 1
		end

		it "assigns a new Attachment to @attachment" do
			get :new
			expect(assigns(:attachment)).to be_a_new(Attachment)
		end

		it "assigns the requested id to @attachment.advent_calendar_item_id" do
			get :new, id: 1
			expect(assigns(:attachment).advent_calendar_item_id).to eq 1
		end

		it "renders the :new template" do
			get :new
			expect(response).to render_template :new
		end
	end

	describe "GET #edit" do
		it "assigns the requested item to @item" do
			item = create(:item, advent_calendar_item_id: 1)
			get :edit, use_route: :radvent, id: item
			expect(assigns(:item)).to eq item
		end

		it "renders the :edit template" do
			item = create(:item)
			get :edit, use_route: :radvent, id: item
			expect(response).to render_template :edit
		end

		it "raises an error when the requested item is not found" do
			expect{ get :edit, use_route: :radvent, id: 1 }.to raise_error
		end
	end

	describe "POST #create" do
		it "renders the :preview if there's an preview_button param" do
			post :create, item: attributes_for(:item), preview_button: true
			expect(response).to render_template :preview
		end

		it "saves the new item in the database" do
			 expect{
			 	post :create, item: attributes_for(:item, advent_calendar_item_id: 1)
			 	}.to change(Item, :count).by(1)
		end

		it "renders the :new if the new item is not saved" do
			allow_any_instance_of(Item).to receive(:save).and_return(false)
			post :create,item: attributes_for(:item)
			expect(response).to render_template :new
		end

		it "redirects to advent_calendar_items#show if the new item is saved" do
			post :create, item: attributes_for(:item, advent_calendar_item_id: 1)
			expect(response).to redirect_to advent_calendar_item_path(id: 1)
		end
	end

	describe "PATCH #update" do
		before :each do
			@item = create(:item, advent_calendar_item_id: 1)
		end

		it "locates the requested @item" do
			patch :update, id: @item, item: attributes_for(:item)
			expect(assigns(:item)).to eq(@item)
		end

		it "renders the :preview if there's an preview_button param" do
			patch :update, id: @item, item: attributes_for(:item), preview_button: true
			expect(response).to render_template :preview
		end

		it "changes @item's attributes" do
			patch :update, id: @item, item: attributes_for(:item,
				title: "title_updated", body: "body_updated")
			@item.reload
			expect(@item.title).to eq("title_updated")
			expect(@item.body).to eq("body_updated")
		end

		it "renders the :edit if the item is not updated" do
			allow_any_instance_of(Item).to receive(:save).and_return(false)
			patch :update, id: @item, item: attributes_for(:item)
			expect(response).to render_template :edit
		end

		it "redirects to advent_calendar_items#show if the item is updated" do
			patch :update, id: @item, item: attributes_for(:item)
			expect(response).to redirect_to advent_calendar_item_path(@item)
		end
	end
end
