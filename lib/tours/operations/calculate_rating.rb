# frozen_string_literal: true

module Tours
  module Operations
    class CalculateRating < ::Core::Operation
      include WeeTravels::Deps[
                query: 'tours.queries.resource'
              ]

      def call(resource:)
        rating = query.calculate_rating(resource)

        Try() do
          resource.update!(rating: rating)
        end.to_result
      end
    end
  end
end
