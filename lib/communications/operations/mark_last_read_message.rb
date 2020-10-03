# frozen_string_literal: true

module Communications
  module Operations
    class MarkLastReadMessage < ::Core::Operation
      include WeeTravels::Deps[
                query: 'communications.queries.collection'
              ]

      def call(params:, conversation:, message:)
        ActiveRecord::Base.transaction do
          collection = query.all_unread_users(conversation_id: conversation.id, params: params)

          Try() do
            collection.update_all(message_id: message.id)
          end
        end
      end
    end
  end
end
