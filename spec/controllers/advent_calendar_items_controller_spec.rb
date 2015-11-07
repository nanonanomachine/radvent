require 'rails_helper'

RSpec.describe AdventCalendarItemsController, :type => :controller do
  describe "GET #show" do
    it "assigns the requested advent_calendar_item to @advent_calendar_item" do
      advent_calendar_item = create(:advent_calendar_item)
      get :show, id: advent_calendar_item
      expect(assigns(:advent_calendar_item)).to eq advent_calendar_item
    end

    it "renders the :show template" do
      advent_calendar_item = create(:advent_calendar_item)
      get :show, id: advent_calendar_item
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new advent_calendar_item to @advent_calendar_item" do
      get :new, date: 1
      expect(assigns(:advent_calendar_item)).to be_a_new(AdventCalendarItem)
    end

    it "assigns the requested date to @advent_calendar_item.date" do
      get :new, date: 1
      expect(assigns(:advent_calendar_item).date).to eq 1
    end

    it "renders the :new template" do
      get :new, date: 1
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested advent_calendar_item to @advent_calendar_item" do
      advent_calendar_item = create(:advent_calendar_item)
      get :edit, id: advent_calendar_item
      expect(assigns(:advent_calendar_item)).to eq advent_calendar_item
    end

    it "renders the :edit template" do
      advent_calendar_item = create(:advent_calendar_item)
      get :edit, id: advent_calendar_item
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    it "saves the new advent_calendar_item in the database" do
      expect{
        post :create, advent_calendar_item: attributes_for(
          :advent_calendar_item)
      }.to change(AdventCalendarItem, :count).by(1)
    end

    it "redirects to advent_calendar_items#show" do
      post :create, advent_calendar_item: attributes_for(
        :advent_calendar_item)
        expect(response).to redirect_to advent_calendar_item_path(
          id: 1)
    end
  end

  describe "PATCH #update" do
    before :each do
      @advent_calendar_item = create(:advent_calendar_item)
    end

    it "locates the requested @advent_calendar_item" do
      patch :update, id: @advent_calendar_item,
        advent_calendar_item: attributes_for(:advent_calendar_item)
      expect(assigns(:advent_calendar_item)).to eq(@advent_calendar_item)
    end

    it "changes @advent_calendar_item's attributes" do
      patch :update, id: @advent_calendar_item,
        advent_calendar_item: attributes_for(:advent_calendar_item,
                                             user_name: "user_name_updated", comment: "comment_updated")
      @advent_calendar_item.reload
      expect(@advent_calendar_item.user_name).to eq("user_name_updated")
      expect(@advent_calendar_item.comment).to eq("comment_updated")
    end

    it "renders the :edit if the advent_calendar_item is not updated" do
      allow_any_instance_of(AdventCalendarItem).to receive(:save)
      .and_return(false)
      patch :update, id: @advent_calendar_item,
        advent_calendar_item: attributes_for(:advent_calendar_item)
      expect(response).to render_template :edit
    end

    it "redirects to advent_calendar_item#show if the advent_calendar_item is updated" do
      patch :update, id: @advent_calendar_item,
        advent_calendar_item: attributes_for(:advent_calendar_item)
      expect(response).to redirect_to advent_calendar_item_path(
        @advent_calendar_item)
    end
  end
end
