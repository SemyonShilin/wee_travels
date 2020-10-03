# frozen_string_literal: true

module Api
  module V0
    class MessagesController < BaseController
      schema(:index) do
        optional(:conversation_id).maybe(:integer)
      end

      def index
        result = resolve('messages.index').call(input: safe_params)

        case result
        in Success(resource)
          render json: resource.as_json
        in Failure[status, message]
          render json: { message: message }, status: status
        end
      end

      schema(:create) do
        required(:owner_id).filled(:integer)
        required(:owner_type).filled(:string)
        required(:body).filled(:string)
        required(:conversation_id).filled(:integer)
      end

      def create
        result = resolve('messages.create').call(input: safe_params.to_h)

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
