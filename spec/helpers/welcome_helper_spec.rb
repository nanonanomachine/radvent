require 'rails_helper'

describe WelcomeHelper do
  it "returns true if the date is in advent calendar's date" do
    expect(advent_calendar_date?(Date.new(2015, 12, 1))).to be_truthy
  end

  it "retuns false if the date is before advent calendar's date" do
    expect(advent_calendar_date?(Date.new(2015, 11, -1))).to be_falsey
  end

  it "returns false if the date is after advent calendar's date" do
    expect(advent_calendar_date?(Date.new(2015, 12, 26))).to be_falsey
  end
end
