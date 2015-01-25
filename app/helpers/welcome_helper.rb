module WelcomeHelper
    def advent_calendar_date?(date)
        date.month == Constants::MONTH  &&
            date.day >= Constants::START_DAY &&
            date.day <= Constants::END_DAY
    end
end
