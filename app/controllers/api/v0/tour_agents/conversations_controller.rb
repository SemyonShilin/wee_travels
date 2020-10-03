# frozen_string_literal: true

module Api
  module V0
    module TourAgents
      class ConversationsController < BaseController
        schema(:index) do
          required(:tour_agent_id).filled(:integer)
        end

        def index
          result = resolve('tour_agents.conversations.index').call(input: safe_params.to_h)

          case result
          in Success(resource)
            render json: resource.as_json
          in Failure[status, message]
            render json: { message: message }, status: status
          end
        end

        schema(:create) do
          required(:tour_agent_id).filled(:integer)
          required(:customers).array(:integer)
          optional(:title).maybe(:string)
          optional(:description).maybe(:string)
        end

        def create
          result = resolve('tour_agents.conversations.create').call(input: safe_params.to_h)

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
