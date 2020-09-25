module Tours
  module Queries
    class Resource
      include WeeTravels::Deps[model: :tour]

      def find(id)
        model.find(id)
      end
    end
  end
end
