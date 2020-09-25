module Tours
  class Show < Operation
    include WeeTravels::Deps[
              'tours.operations.find'
            ]

    def call(id:)
      find.call(id: id)
    end
  end
end
