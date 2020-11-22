# frozen_string_literal: true

module Messages
  module Operations
    class Push < ::Core::Operation
      include WeeTravels::Deps[
                channel: :conversation_channel
              ]

      def call(resource:)
        Try() do
          channel.broadcast_to(
            resource.conversation, resource.as_json(include: %i[owner communications])
          )
        end.to_result
      end
    end
  end
end
