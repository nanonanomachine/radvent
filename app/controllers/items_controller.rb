class ItemsController < ApplicationController
	def new
		@date = params[:date]
		@item = Item.new(advent_calendar_item_id: params[:id])
	end

	def create
		@item = Item.new(item_params)
		 
		if params[:preview_button]
			render :preview
		elsif !@item.save
			render :new
		else
			redirect_to advent_calendar_item_path(id: @item.advent_calendar_item_id)
		end
	end

	def show
		today = Time.zone.today
		@item = Item.find(params[:id])
		redirect_to root_path if today.month != 12 || @item.advent_calendar_item.date > today.day
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		@item.assign_attributes(item_params)
        
        if params[:preview_button]
        	render :preview
        elsif !@item.save
        	render :edit
        else
        	redirect_to advent_calendar_item_path(id: @item.advent_calendar_item_id)        	
        end
	end

	def preview
	end

	private
	def item_params
		params.require(:item).permit(:title, :body, :advent_calendar_item_id)
	end
end
