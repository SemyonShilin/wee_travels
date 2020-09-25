module TourAgents
  module Queries
    class Resource
      include WeeTravels::Deps[model: :tour_agent]

      def find(id)
        model.find(id)
      end
    end
  end
end