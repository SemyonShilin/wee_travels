module Tours
  class Create < Operation
    include WeeTravels::Deps[
              'tours.operations.create'
            ]

    def call(input:)
      create.call(input: input)
    end
  end
end
