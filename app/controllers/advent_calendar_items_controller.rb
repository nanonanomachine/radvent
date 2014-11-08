class AdventCalendarItemsController < ApplicationController
	def new
		@advent_calendar_item = AdventCalendarItem.new(date: params[:date])
	end

	def create
		advent_calendar_item = AdventCalendarItem.create(advent_calendar_item_params)
		redirect_to new_item_path advent_calendar_item_id: advent_calendar_item.id
	end

	private 
	def advent_calendar_item_params
		params.require(:advent_calendar_item).permit(:user_name, :comment, :date)
	end
end
