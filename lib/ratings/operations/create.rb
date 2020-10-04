# frozen_string_literal: true

module Ratings
  module Operations
    class Create < ::Core::Operation
      include WeeTravels::Deps[
                model: :rating
              ]

      def call(input:, tour:, customer:)
        Try() do
          resource = model.new(value: input[:value], comment: input[:comment])
          resource.customer = customer
          resource.tour = tour
          resource.tap(&:save!)
        end.to_result
      end
    end
  end
end
