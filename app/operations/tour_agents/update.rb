module TourAgents
  class Update < Operation
    include WeeTravels::Deps[
              'tour_agents.operations.find',
              'tour_agents.operations.authenticate'
            ]

    def call(input:)
      # validator
      resource = yield find.call(id: input[:id])

      Try() do
        resource.assign_attributes(input.to_h)
        resource.save!
      end.to_result
    end
  end
end
