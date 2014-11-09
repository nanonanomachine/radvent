class ItemsController < ApplicationController
	def new
		@date = params[:date]
		@item = Item.new(advent_calendar_item_id: params[:id])
		puts @item.advent_calendar_item_id
	end

	def create
		item = Item.create(item_params)
		redirect_to advent_calendar_item_path(id: item.advent_calendar_item_id)
	end

	def show
		@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			redirect_to advent_calendar_item_path(id: @item.advent_calendar_item_id)
		else
			render :edit
		end
	end

	private
	def item_params
		params.require(:item).permit(:title, :body, :advent_calendar_item_id)
	end
end
