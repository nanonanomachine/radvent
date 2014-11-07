class AdventCalendarItemsController < ApplicationController
	def new
		@advent_calendar_item = AdventCalendarItem.new(date: params[:date])
	end

	def create
		AdventCalendarItem.create(advent_calendar_item_params)
		redirect_to welcome_index_path
	end

	private 
	def advent_calendar_item_params
		params.require(:advent_calendar_item).permit(:user_name, :comment, :date)
	end
end
