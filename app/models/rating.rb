class Rating < ApplicationRecord
  belongs_to :customer
  belongs_to :tour, counter_cache: true
end
