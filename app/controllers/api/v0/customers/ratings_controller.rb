# frozen_string_literal: true

module Api
  module V0
    module Customers
      class RatingsController < BaseController
        schema(:index) do
          required(:tour_id).filled(:integer)
        end

        def index
          result = resolve('customers.ratings.index').call(input: safe_params.to_h)

          case result
          in Success(resource)
            render json: resource.as_json
          in Failure[status, message]
            render json: { message: message }, status: status
          end
        end

        schema(:create) do
          required(:customer_id).filled(:integer)
          required(:tour_id).filled(:integer)
          required(:value).filled(:integer)
          required(:comment).filled(:string)
        end

        def create
          result = resolve('customers.ratings.create').call(input: safe_params.to_h)

          case result
          in Success(resource)
            render json: resource.as_json
          in Failure[status, message]
            render json: { message: message }, status: status
          end
        end
      end
    end
  end
end
