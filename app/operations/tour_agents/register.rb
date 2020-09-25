module TourAgents
  class Register < Operation
    include WeeTravels::Deps[
              'tour_agents.operations.create',
              'tour_agents.operations.authenticate'
            ]

    def call(input:)
      resource = yield create.call(input: input)
      token = yield authenticate.call(resource: resource, input: input)

      Success(token: token, refresh_token: '')
    end
  end
end
