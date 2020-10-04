class Rating < ApplicationRecord
  belongs_to :customer
  belongs_to :tour
end
