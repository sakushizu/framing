class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, counter_cache: :favorites_count
end
