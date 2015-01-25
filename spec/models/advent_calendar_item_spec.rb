require 'rails_helper'

describe AdventCalendarItem do
	it "returns previous advent_calendar_item which has Item" do
		create(:advent_calendar_item, date: 1)
		expect(AdventCalendarItem.prev(2).first.date).to equal(1)
	end

	it "returns next advent_calendar_item which has Item" do
		create(:advent_calendar_item, date: 2)
		expect(AdventCalendarItem.next(1).first.date).to equal(2)
	end

	it "returns nil if there are no previous advent_calendar_item" do
		expect(AdventCalendarItem.prev(1).first).to be_nil
	end

	it "returns nil if there are no previous advent_calendar_item which has Item" do
		create(:advent_calendar_item, date: 1, item: nil)
		expect(AdventCalendarItem.prev(2).first).to be_nil
	end

	it "returns nil if there are no next advent_calendar_item" do
		expect(AdventCalendarItem.next(1).first).to be_nil
	end

	it "returns nil if there are no next advent_calendar_item which have Item" do
		create(:advent_calendar_item, date: 2, item: nil)
		expect(AdventCalendarItem.next(1).first).to be_nil
	end

    describe "#published?" do
        before :each do
            today = Date.new(2015, 12, 1)
            allow(Time.zone).to receive(:today).and_return(today)
        end

        it "returns true if it has an item and it's date is passed" do
            advent_calendar_item = build(:advent_calendar_item, date:1)
            expect(advent_calendar_item.published?).to be_truthy
        end

        it "returns false if it doesn't have an item" do
            advent_calendar_item = build(:advent_calendar_item, date: 1, item:nil)
            expect(advent_calendar_item.published?).to be_falsey
        end

        it "returns false if it's date isn't passed" do
            advent_calendar_item = build(:advent_calendar_item, date:2)
            expect(advent_calendar_item.published?).to be_falsey
        end
    end
end
