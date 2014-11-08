class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :body
      t.integer :advent_calendar_item_id

      t.timestamps
    end
  end
end
