# frozen_string_literal: true

module Conversations
  module Operations
    class Find < ::Core::Operation
      include WeeTravels::Deps[
                query: 'conversations.queries.resource'
              ]

      def call(id:)
        result = query.find(id)
        result.present? ? Success(result) : Failure[404, :not_found]
      end
    end
  end
end
