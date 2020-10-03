# frozen_string_literal: true

module Customers
  module Conversations
    class Index < Operation
      include WeeTravels::Deps[
                  'conversations.operations.list',
                  'customers.operations.find'
              ]

      def call(input:)
        user = yield find.call(id: input[:customer_id])
        list.call(user: user)
      end
    end
  end
end
