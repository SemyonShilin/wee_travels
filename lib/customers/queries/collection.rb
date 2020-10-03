# frozen_string_literal: true

module Customers
  module Queries
    class Collection
      include WeeTravels::Deps[model: :customer]

      def for_conversation(ids)
        model.where(id: ids)
      end
    end
  end
end
