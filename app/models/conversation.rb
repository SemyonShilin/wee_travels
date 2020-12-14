# frozen_string_literal: true

class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :communications, dependent: :destroy
  has_many :customers, through: :communications, source_type: 'Customer', source: :user
  has_many :tour_agents, through: :communications, source_type: 'TourAgent', source: :user
  belongs_to :tour, optional: true
end
