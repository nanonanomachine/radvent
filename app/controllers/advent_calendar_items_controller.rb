class AdventCalendarItemsController < ApplicationController
	def new
		@advent_calendar_item = AdventCalendarItem.new(date: params[:date])
	end

	def create
		advent_calendar_item = AdventCalendarItem.create(advent_calendar_item_params)
		redirect_to new_item_path advent_calendar_item_id: advent_calendar_item.id
	end

	def show
		@advent_calendar_item = AdventCalendarItem.find(params[:id])
	end

	def edit
		@advent_calendar_item = AdventCalendarItem.find(params[:id])
	end

	def update
		@advent_calendar_item = AdventCalendarItem.find(params[:id])
		if @advent_calendar_item.update(advent_calendar_item_params)
			render :edit, id: params[:id], notice: '更新しました'
		else
			render :edit
		end
	end

	private 
	def advent_calendar_item_params
		params.require(:advent_calendar_item).permit(:user_name, :comment, :date)
	end
end
