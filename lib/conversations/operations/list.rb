# frozen_string_literal: true

module Conversations
  module Operations
    class List < ::Core::Operation
      include WeeTravels::Deps[
                query: 'conversations.queries.collection'
              ]

      def call(user:)
        result = query.current_conversations(user: user)
        result.present? ? Success(result) : Success([])
      end
    end
  end
end
