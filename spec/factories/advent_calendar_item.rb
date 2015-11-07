FactoryGirl.define do
  factory :advent_calendar_item do
    user_name "nanonanomachine"
    comment "comment"
    association :item
  end
end
