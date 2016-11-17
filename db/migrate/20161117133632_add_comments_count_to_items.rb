class AddCommentsCountToItems < ActiveRecord::Migration
  def up
    add_column :items, :comments_count, :integer, null: false, default: 0
    Item.find_each { |i| Item.reset_counters(i.id, :comments) }
  end

  def down
    remove_column :items, :comments_count
  end
end
