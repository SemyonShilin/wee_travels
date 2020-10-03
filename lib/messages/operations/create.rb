# frozen_string_literal: true

module Messages
  module Operations
    class Create < ::Core::Operation
      include WeeTravels::Deps[
                model: :message,
                contract: 'messages.contracts.new'
              ]

      def call(input:, conversation:)
        result = yield contract.call(input)

        Try() do
          resource = model.new(result.to_h)
          resource.conversation = conversation
          resource.tap(&:save!)
        end.to_result
      end
    end
  end
end
