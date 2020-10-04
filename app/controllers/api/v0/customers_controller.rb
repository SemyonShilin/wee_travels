# frozen_string_literal: true

module Api
  module V0
    class CustomersController < BaseController
      schema(:show) do
        required(:id).filled(:integer)
      end

      def show
        result = resolve('customers.show').call(id: safe_params[:id])

        case result
        in Success(resource)
          render json: resource.as_json(except: :password_digest)
        in Failure[status, message]
          render json: { message: message }, status: status
        end
      end
    end
  end
end
