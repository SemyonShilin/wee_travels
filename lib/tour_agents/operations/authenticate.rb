# frozen_string_literal: true

module TourAgents
  module Operations
    class Authenticate < Core::Operation
      include WeeTravels::Deps['core.jwt']

      def call(resource:, input:)
        # need refresh token
        if resource.authenticate(input[:password])
          jwt.encode(user_id: resource.id)
        else
          Failure()
        end
      end
    end
  end
end
