# frozen_string_literal: true

module Messages
  class Index < Operation
    include WeeTravels::Deps[
              'messages.operations.list',
              'conversations.operations.find'
            ]

    def call(input:)
      conversation = yield find.call(id: input[:conversation_id])
      list.call(conversation: conversation)
    end
  end
end
