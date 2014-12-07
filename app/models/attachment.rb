class Attachment < ActiveRecord::Base
  belongs_to :advent_calendar_item
  mount_uploader :image, ImageUploader
end
