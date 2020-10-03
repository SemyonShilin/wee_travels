# frozen_string_literal: true

module TourAgents
  module Queries
    class Resource
      include WeeTravels::Deps[model: :tour_agent]

      delegate :find, to: :model
    end
  end
end
