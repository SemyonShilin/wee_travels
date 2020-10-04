# frozen_string_literal: true

module Customers
  module Ratings
    class Index < Operation
      include WeeTravels::Deps[
                'tours.operations.find',
                'ratings.operations.list',
              ]

      def call(input:)
        tour = yield find.call(id: input[:tour_id])
        list.call(tour: tour)
      end
    end
  end
end
