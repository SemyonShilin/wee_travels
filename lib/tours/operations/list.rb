module Tours
  module Operations
    class List < ::Core::Operation
      include WeeTravels::Deps[
                query: 'tours.queries.collection'
              ]

      def call(input:)
        result = query.all
        result.present? ? Success(result) : Success([])
      end
    end
  end
end
