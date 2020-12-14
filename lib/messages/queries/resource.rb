# frozen_string_literal: true

module Conversations
  module Queries
    class Resource
      include WeeTravels::Deps[model: :conversation]

      def find(id)
        model.find_by(id: id)
      end
    end
  end
end
