# frozen_string_literal: true

module Api
  module V0
    class TourAgentsController < BaseController
      schema(:show) do
        required(:id).filled(:integer)
      end

      def show
        result = resolve('tour_agents.show').call(id: safe_params[:id])

        case result
        in Success(resource)
          render json: resource.as_json(except: :password_digest)
        in Failure[status, message]
          render json: { message: message }, status: status
        end
      end

      schema(:update) do
        required(:id).filled(:integer)
        required(:email).filled(:string)
      end

      def update
        result = resolve('tour_agents.update').call(input: safe_params.to_h)

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
