# frozen_string_literal: true

module Messages
  class Create < Operation
    include WeeTravels::Deps[
              'conversations.operations.find_or_create',
              'messages.operations.create',
              mark_others_unread: 'communications.operations.mark_last_read_message',
            ]

    def call(input:)
      ActiveRecord::Base.transaction do
        conversation = yield find_or_create.call(input: input)
        message = yield create.call(input: input, conversation: conversation)
        owner = input[:owner_type].constantize.find(input[:owner_id])
        yield mark_others_unread.call(params: { user: owner }, conversation: conversation, message: message)

        Success(message)
      end
    end
  end
end