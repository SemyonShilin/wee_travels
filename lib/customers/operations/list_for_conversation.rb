# frozen_string_literal: true

module Customers
  module Operations
    class ListForConversation < ::Core::Operation
      include WeeTravels::Deps[
                query: 'customers.queries.collection'
              ]

      def call(ids:)
        Success(query.for_conversation(ids))
      end
    end
  end
end
