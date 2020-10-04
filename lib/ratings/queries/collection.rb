# frozen_string_literal: true

module Ratings
  module Queries
    class Collection
      include WeeTravels::Deps[model: :rating]

      def for_current_tour(tour)
        model.where(tour: tour)
      end
    end
  end
end
