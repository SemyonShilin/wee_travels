# frozen_string_literal: true

module Messages
  module Queries
    class Collection
      include WeeTravels::Deps[model: :message]

      def for_current_conversation(conversation:)
        model.where(conversation_id: conversation.id)
      end
    end
  end
end
