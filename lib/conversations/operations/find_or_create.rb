# frozen_string_literal: true

module Conversations
  module Operations
    class FindOrCreate < ::Core::Operation
      include WeeTravels::Deps[
                'conversations.operations.build',
                'conversations.operations.find'
              ]

      def call(input:)
        result = find.call(id: input[:conversation_id])

        if result.success?
          result
        else
          build.call(input: input)
        end
      end
    end
  end
end
