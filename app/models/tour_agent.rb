# frozen_string_literal: true

class TourAgent < ApplicationRecord
  has_secure_password

  has_many :tours, dependent: :destroy
end
