# frozen_string_literal: true

module Conversations
  module Operations
    class Create < ::Core::Operation
      include WeeTravels::Deps[
                model: :conversation
              ]

      def call(input:)
        Try() do
          resource = model.new(title: input[:title])
          resource.tap(&:save!)
        end.to_result
      end
    end
  end
end
