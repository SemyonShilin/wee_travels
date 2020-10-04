# frozen_string_literal: true

module Api
  module V0
    class ToursController < BaseController
      def index
        result = resolve('tours.index').call(input: safe_params.to_h)

        case result
        in Success(resource)
          render json: resource
        in Failure[status, message]
          render json: { message: message }, status: status
        end
      end

      schema(:show) do
        required(:id).filled(:integer)
      end

      def show
        result = resolve('tours.show').call(id: safe_params[:id])

        case result
        in Success(resource)
          render json: resource.as_json(include: %i[ratings tour_agent])
        in Failure[status, message]
          render json: { message: message }, status: status
        end
      end
    end
  end
end
