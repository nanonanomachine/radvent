class WelcomeController < ApplicationController
  def index
  	from_date = Date.new(2014, 12, 1).beginning_of_week(:sunday)
  	to_date = Date.new(2014, 12, 31).end_of_week(:sunday)
  	@calendar_data = split_week(from_date.upto(to_date))
  	@advent_calendar_items =AdventCalendarItem.all
  	@today = Date.today
  end

  private
  def split_week(range)
  	weeks = []
  	week = []
  		
  	range.each do |date|
  		week << date
  		if date.wday == 6
  			weeks << week
  			week = []
  		end
  	end
  	weeks << week
  end
end
