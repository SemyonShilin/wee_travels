# frozen_string_literal: true

module Conversations
  module Queries
    class Collection
      include WeeTravels::Deps[model: :conversation]

      def current_conversations(user:)
        model.includes(:communications).where(communications: { user: user })
      end
    end
  end
end
