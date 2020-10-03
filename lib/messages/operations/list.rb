# frozen_string_literal: true

module Messages
  module Operations
    class List < ::Core::Operation
      include WeeTravels::Deps[
                query: 'messages.queries.collection'
              ]

      def call(conversation:)
        result = query.for_current_conversation(conversation: conversation)
        Success(result)
      end
    end
  end
end
