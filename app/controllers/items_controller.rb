class ItemsController < ApplicationController
	def new
		@item = Item.new(advent_calendar_item_id: params[:id])
	end

	def create
		Item.create(item_params)
		redirect_to root_path
	end

	private
	def item_params
		params.require(:item).permit(:title, :comment, :advent_calendar_item_id)
	end
end
