# frozen_string_literal: true

module Customers
  module Ratings
    class Create < Operation
      include WeeTravels::Deps[
                'customers.operations.find',
                'ratings.operations.create',
                'tours.operations.calculate_rating',
                tour_find: 'tours.operations.find',
              ]

      def call(input:)
        ActiveRecord::Base.transaction do
          user = yield find.call(id: input[:customer_id])
          tour = yield tour_find.call(id: input[:tour_id])
          rating = yield create.call(input: input, customer: user, tour: tour)
          yield calculate_rating.call(resource: tour)

          Success(rating)
        end
      end
    end
  end
end
