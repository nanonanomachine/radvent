class Item < ActiveRecord::Base
	belongs_to :advent_calendar_item
	has_many :comments, dependent: :destroy
end
