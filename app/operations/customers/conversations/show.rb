# frozen_string_literal: true

module Customers
  module Conversations
    class Show < Operation
      include WeeTravels::Deps[
                'conversations.operations.find'
              ]

      def call(input:)
        find.call(id: input[:id])
      end
    end
  end
end
