require 'rails_helper'

describe WelcomeController, :type => :controller do
	describe "GET #index" do
		it 'is Sunday for the first element of @calendar_date' do
			get :index
			expect(assigns(:calendar_data).first.first.wday).to eq 0
		end

		it 'is Saturday for the last element of @calendar_date' do
			get :index
			expect(assigns(:calendar_data).last.last.wday).to eq 6
		end

		it 'assigns an array of all AdventCalendarItems to @advent_calendar_items' do
			first = create(:advent_calendar_item)
			second = create(:advent_calendar_item)
			get :index
			expect(assigns(:advent_calendar_items)).to match_array([first, second])
		end

		it 'assigns today' do
			get :index
			expect(assigns(:today)).to eq Time.zone.today
		end

		it 'renders the :index template' do
			 get :index
			 expect(response).to render_template :index
		end
	end
end
