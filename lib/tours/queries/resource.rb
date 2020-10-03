# frozen_string_literal: true

module Tours
  module Queries
    class Resource
      include WeeTravels::Deps[model: :tour]

      delegate :find, to: :model
    end
  end
end
