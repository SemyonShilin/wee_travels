module Tours
  module Queries
    class Collection
      include WeeTravels::Deps[model: :tour]

      def all
        model.all
      end
    end
  end
end
