# frozen_string_literal: true

module Tours
  module Queries
    class Collection
      include WeeTravels::Deps[model: :tour]

      delegate :all, to: :model
    end
  end
end
