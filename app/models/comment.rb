class Comment < ActiveRecord::Base
  belongs_to :item, counter_cache: true
end
