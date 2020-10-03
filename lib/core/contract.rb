# frozen_string_literal: true

module Core
  class Contract < ::Dry::Rails::Features::ApplicationContract
    Dry::Validation.load_extensions(:monads)

    def call(input)
      super(input).to_monad
    end
  end
end
