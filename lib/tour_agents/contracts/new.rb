# frozen_string_literal: true

module TourAgents
  module Contracts
    class New < Core::Contract
      params do
        required(:email).filled(:string)
        required(:password).filled(min_size?: 8)
        required(:password_confirmation).filled(:string)
      end

      rule(:email) do
        key.failure('has invalid format') unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
      end

      rule(:password_confirmation, :password) do
        unless values[:password_confirmation].eql?(values[:password])
          key(:password_confirmation).failure('do not equal')
        end
      end
    end
  end
end
