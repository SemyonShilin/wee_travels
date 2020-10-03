# frozen_string_literal: true

module Communications
  module Queries
    class Collection
      include WeeTravels::Deps[model: :communication]

      def all_unread_users(conversation_id:, params:)
        model.where(conversation_id: conversation_id).where.not(user: params[:user])
      end
    end
  end
end
