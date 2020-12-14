# frozen_string_literal: true

module Conversations
  module Operations
    class ForTour < ::Core::Operation
      include WeeTravels::Deps[
                query: 'conversations.queries.collection'
              ]

      def call(input:)
        result = query.for_tour(input)
        result.present? ? Success(result) : Failure[404, :not_found]
      end
    end
  end
end
