# frozen_string_literal: true

module Api
  module V0
    module TourAgents
      class ToursController < BaseController
        def index
          result = resolve('tours.index').call(input: safe_params.to_h)

          case result
          in Success(resource)
            render json: resource.as_json
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
            render json: resource.as_json
          in Failure[status, message]
            render json: { message: message }, status: status
          end
        end

        schema(:create) do
          required(:title).filled(:string)
          required(:description).filled(:string)
          required(:tour_agent_id).filled(:integer)
        end

        def create
          result = resolve('tours.create').call(input: safe_params.to_h)

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
