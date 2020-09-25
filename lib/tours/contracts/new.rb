module Tours
  module Contracts
    class New < Core::Contract
      params do
        required(:title).filled(:string)
        required(:description).filled(:string)
      end
    end
  end
end
