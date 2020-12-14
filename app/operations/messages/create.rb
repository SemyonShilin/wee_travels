# frozen_string_literal: true

module Messages
  class Create < Operation
    include WeeTravels::Deps[
              'conversations.operations.find_or_create',
              'messages.operations.create',
              'messages.operations.push',
              mark_others_unread: 'communications.operations.mark_last_read_message',
            ]

    def call(input:)
      ActiveRecord::Base.transaction do
        conversation = yield find_or_create.call(input: input)
        owner = input[:owner_type].constantize.find(input[:owner_id])
        message = yield create.call(input: input.merge(owner: owner), conversation: conversation)
        yield mark_others_unread.call(params: { user: owner }, conversation: conversation, message: message)
        yield push.call(resource: message)

        Success(message)
      end
    end
  end
end
