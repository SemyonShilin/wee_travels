# frozen_string_literal: true

module Communications
  module Operations
    class Create < ::Core::Operation
      include WeeTravels::Deps[
                model: :communication
              ]

      def call(user:, conversation:)
        Try() do
          resource = model.new(user: user, conversation: conversation)
          resource.tap(&:save!)
        end.to_result
      end
    end
  end
end
