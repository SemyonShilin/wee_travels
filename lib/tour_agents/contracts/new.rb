module TourAgents
  module Contracts
    class New < Core::Contract
      params do
        required(:email).filled(:string)
        required(:password).filled(min_size?: 8)
        required(:password_confirmation).filled(:string)
      end

      rule(:email) do
        unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
          key.failure('has invalid format')
        end
      end

      rule(:password_confirmation, :password) do
        key(:password_confirmation).failure('do not equal') unless values[:password_confirmation].eql?(values[:password])
      end
    end
  end
end
