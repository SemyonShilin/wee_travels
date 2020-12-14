# frozen_string_literal: true

module Conversations
  module Queries
    class Collection
      include WeeTravels::Deps[model: :conversation]

      def current_conversations(user:)
        model.includes(:communications).where(communications: { user: user })
      end

      def for_tour(input)
        prepared = model.includes(:customers).where(dialog: true)
        prepared.where(tour_id: input[:tour_id], communications: { customers: { id: input[:customer_id] } }).last
      end
    end
  end
end
