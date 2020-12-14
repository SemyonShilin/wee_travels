# frozen_string_literal: true

module Conversations
  module Operations
    class Build < ::Core::Operation
      include WeeTravels::Deps[
                operation: 'conversations.operations.create',
                communication_operation: 'communications.operations.build',
                tour_agent_operation: 'tour_agents.operations.find',
                customer_operation: 'customers.operations.find'
              ]

      def call(input:)
        ActiveRecord::Base.transaction do
          conversation = yield operation.call(input: input)
          customer = yield customer_operation.call(id: input[:customer_id])
          tour_agent = yield tour_agent_operation.call(id: input[:tour_agent_id])
          yield communication_operation.call(users: [customer, tour_agent], conversation: conversation)

          Success(conversation.reload)
        end
      end
    end
  end
end
