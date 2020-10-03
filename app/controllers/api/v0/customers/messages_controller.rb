# frozen_string_literal: true

module Api
  module V0
    module Customers
      class MessagesController < BaseController
        schema(:create) do
          required(:customer_id).filled(:integer)
          required(:tour_agent_id).filled(:integer)
          required(:body).filled(:string)
        end

        def create
          result = resolve('customers.messages.create').call(input: safe_params.to_h)

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
