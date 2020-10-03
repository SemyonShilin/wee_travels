# frozen_string_literal: true

module TourAgents
  module Conversations
    class Index < Operation
      include WeeTravels::Deps[
                'conversations.operations.list',
                'tour_agents.operations.find'
              ]

      def call(input:)
        user = yield find.call(id: input[:tour_agent_id])
        list.call(user: user)
      end
    end
  end
end
