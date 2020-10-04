# frozen_string_literal: true

module Customers
  class Show < Operation
    include WeeTravels::Deps[
              'customers.operations.find'
            ]

    def call(id:)
      find.call(id: id)
    end
  end
end
