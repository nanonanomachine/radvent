class AdventCalendarItem < ActiveRecord::Base
  has_one :item, dependent: :destroy
  has_many :attachments, dependent: :destroy
  scope :prev, ->(date) { joins(:item).where("date < ?", date).order(:date).reverse_order}
  scope :next, ->(date) { joins(:item).where("date > ?", date).order(:date)}

  def published?
    self.item &&
      Date.new(Constants::YEAR, Constants::MONTH, self.date) <= Time.zone.today
  end
end
