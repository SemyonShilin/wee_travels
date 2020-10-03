# frozen_string_literal: true

module Communications
  module Operations
    class Build < ::Core::Operation
      include WeeTravels::Deps[
                'communications.operations.create'
              ]

      def call(users:, conversation:)
        result =
          users.map do |user|
            yield create.call(user: user, conversation: conversation)
          end

        Success(result)
      end
    end
  end
end
