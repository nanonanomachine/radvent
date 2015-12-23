class Item < ActiveRecord::Base
  belongs_to :advent_calendar_item
  has_many :comments, dependent: :destroy

  def title
    self[:title].presence || I18n.t("activerecord.attributes.item.title_empty")
  end
end
