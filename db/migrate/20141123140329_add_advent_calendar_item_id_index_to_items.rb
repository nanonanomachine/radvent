class AddAdventCalendarItemIdIndexToItems < ActiveRecord::Migration
  def change
  	add_index :items, :advent_calendar_item_id, unique: true
  end
end
