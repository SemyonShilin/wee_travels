# frozen_string_literal: true

module Conversations
  module Queries
    class Resource
      include WeeTravels::Deps[model: :conversation]

      delegate :find, to: :model
    end
  end
end
