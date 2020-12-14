# frozen_string_literal: true

module Customers
  module Conversations
    class ForTour < Operation
      include WeeTravels::Deps[
                operation: 'conversations.operations.for_tour'
              ]

      def call(input:)
        operation.call(input: input)
      end
    end
  end
end
