# frozen_string_literal: true

module Api
  module V0
    module TourAgents
      class RegistrationController < BaseController
        schema(:create) do
          required(:email).filled(:string)
          required(:password).filled(:string)
          required(:password_confirmation).filled(:string)
        end

        def create
          result = resolve('tour_agents.register').call(input: safe_params.to_h)

          case result
          in Success(hash)
            response.headers['Authorization'] = "Bearer #{hash[:token]}"
            response.headers['Refresh-Token'] = hash[:refresh_token]
            render json: { success: true, message: 'success' }
          in Failure()
            render json: { success: false, message: 'unauthorized' }, status: :unauthorized
          end
        end
      end
    end
  end
end
