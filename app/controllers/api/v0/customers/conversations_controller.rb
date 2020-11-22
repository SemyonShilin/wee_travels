# frozen_string_literal: true

module Api
  module V0
    module Customers
      class ConversationsController < BaseController
        schema(:index) do
          optional(:customer_id).maybe(:integer)
        end

        def index
          result = resolve('customers.conversations.index').call(input: safe_params)

          case result
          in Success(resource)
            render json: resource.as_json
          in Failure[status, message]
            render json: { message: message }, status: status
          end
        end

        schema(:show) do
          optional(:customer_id).maybe(:integer)
          required(:id).filled(:integer)
        end

        def show
          result = resolve('customers.conversations.show').call(input: safe_params)

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
