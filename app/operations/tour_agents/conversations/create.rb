# frozen_string_literal: true

module TourAgents
  module Conversations
    class Create < Operation
      include WeeTravels::Deps[
                'conversations.operations.create',
                'communications.operations.build',
                'customers.operations.list_for_conversation',
                'tour_agents.operations.find',
              ]

      def call(input:)
        ActiveRecord::Base.transaction do
          conversation = yield create.call(input: input)
          users = yield list_for_conversation.call(ids: input[:customers])
          tour_agent = yield find.call(id: input[:tour_agent_id])
          yield build.call(users: users.to_a << tour_agent, conversation: conversation)

          Success(conversation.reload)
        end
      end
    end
  end
end
