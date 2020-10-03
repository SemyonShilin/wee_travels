# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :owner, polymorphic: true
  has_many :communications, dependent: :nullify
end
