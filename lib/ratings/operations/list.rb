# frozen_string_literal: true

module Ratings
  module Operations
    class List < ::Core::Operation
      include WeeTravels::Deps[
                query: 'ratings.queries.collection'
              ]

      def call(tour:)
        result = query.for_current_tour(tour)
        Success(result)
      end
    end
  end
end
