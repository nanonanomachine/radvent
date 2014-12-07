class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :advent_calendar_item, index: true
      t.string :image

      t.timestamps
    end
  end
end
