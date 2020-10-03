# frozen_string_literal: true

class Communication < ApplicationRecord
  belongs_to :conversation
  belongs_to :message, optional: true
  belongs_to :user, polymorphic: true
end
