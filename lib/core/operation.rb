# frozen_string_literal: true

module Core
  class Operation
    include Dry::Monads[:do, :try, :result]
  end
end
