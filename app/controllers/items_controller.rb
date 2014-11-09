class ItemsController < ApplicationController
	def new
		@item = Item.new(advent_calendar_item_id: params[:id])
	end

	def create
		Item.create(item_params)
		redirect_to root_path
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	private
	def item_params
		params.require(:item).permit(:title, :body, :advent_calendar_item_id)
	end
end
