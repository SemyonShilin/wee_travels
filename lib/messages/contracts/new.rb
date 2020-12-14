# frozen_string_literal: true

module Messages
  module Contracts
    class New < Core::Contract
      params do
        # required(:owner_id).filled(:integer)
        # required(:owner_type).filled(:string)
        required(:owner)
        required(:body).filled(:string)
      end
    end
  end
end
