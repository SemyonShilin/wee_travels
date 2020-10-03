# frozen_string_literal: true

module Tours
  class Index < Operation
    include WeeTravels::Deps[
              'tours.operations.list'
            ]

    def call(input:)
      list.call(input: input)
    end
  end
end
