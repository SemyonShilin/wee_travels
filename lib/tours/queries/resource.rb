# frozen_string_literal: true

module Tours
  module Queries
    class Resource
      include WeeTravels::Deps[model: :tour]

      delegate :find, to: :model

      def calculate_rating(resource)
        ratings = resource.ratings
        ratings.sum(:value) / ratings.count
      end
    end
  end
end
