require 'rails_helper'

describe AdventCalendarItem do
	it "returns previous AdventCalendarItem which has Item" do 
		create(:advent_calendar_item, date: 1)
		expect(AdventCalendarItem.prev(2).first.date).to equal(1)	
	end

	it "returns next AdventCalendarItem which has Item" do
		create(:advent_calendar_item, date: 2)
		expect(AdventCalendarItem.next(1).first.date).to equal(2)
	end

	it "returns nil if there are no previous AdventCalendarItems" do
		expect(AdventCalendarItem.prev(1).first).to be_nil
	end

	it "returns nil if there are no previous AdventClanedarItems which has Item" do
		create(:advent_calendar_item, date: 1, item: nil)
		expect(AdventCalendarItem.prev(2).first).to be_nil
	end

	it "returns nil if there are no next AdvnetCalendarItems" do
		expect(AdventCalendarItem.next(1).first).to be_nil
	end

	it "returns nil if there are no next AdvnetCalendarItems which have Item" do
		create(:advent_calendar_item, date: 2, item: nil)
		expect(AdventCalendarItem.next(1).first).to be_nil
	end
end