# frozen_string_literal: true

module Customers
  module Messages
    class Create < Operation
      include WeeTravels::Deps[
                'conversations.operations.find_or_create',
                'messages.operations.create',
                'customers.operations.find',
                mark_others_unread: 'communications.operations.mark_last_read_message',
              ]

      def call(input:)
        ActiveRecord::Base.transaction do
          conversation = yield find_or_create.call(input: input)
          message = yield create.call(input: input, conversation: conversation)
          user = yield find.call(id: input[:customer_id])
          yield mark_others_unread.call(params: { user: user }, conversation: conversation, message: message)

          Success(message)
        end
      end
    end
  end
end
