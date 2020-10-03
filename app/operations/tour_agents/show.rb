# frozen_string_literal: true

module TourAgents
  class Show < Operation
    include WeeTravels::Deps[
              'tour_agents.operations.find'
            ]

    def call(id:)
      find.call(id: id)
    end
  end
end
