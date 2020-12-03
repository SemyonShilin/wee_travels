class Rating < ApplicationRecord
  belongs_to :customer
<<<<<<< HEAD
  belongs_to :tour, counter_cache: true
=======
  belongs_to :tour
>>>>>>> 73af6dbb44465bee73e2cdbce6b7dc09f5f649ee
end
