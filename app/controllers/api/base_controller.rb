# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    include Dry::Monads[:result]
    include Dry::Rails::Features::ControllerHelpers
    include Dry::Rails::Features::SafeParams

    before_action do
      render(json: { errors: safe_params.errors.to_h }, status: 400) and throw(:abort) if safe_params&.failure?
    end

    private

    def handle_result; end
  end
end
