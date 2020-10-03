# frozen_string_literal: true

module Customers
  module Queries
    class Resource
      include WeeTravels::Deps[model: :customer]

      delegate :find, to: :model
    end
  end
end
