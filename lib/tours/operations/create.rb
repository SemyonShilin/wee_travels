# frozen_string_literal: true

module Tours
  module Operations
    class Create < ::Core::Operation
      include WeeTravels::Deps[
                model: :tour,
                contract: 'tours.contracts.new'
              ]

      def call(input:)
        result = yield contract.call(input)

        Try() do
          resource = model.new(result.to_h)
          resource.save!
        end.to_result
      end
    end
  end
end
