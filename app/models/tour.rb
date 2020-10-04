# frozen_string_literal: true

class Tour < ApplicationRecord
  belongs_to :tour_agent
  has_many :ratings, dependent: :destroy
end
