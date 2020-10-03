# frozen_string_literal: true

class TourAgent < ApplicationRecord
  has_secure_password

  has_many :tours, dependent: :destroy
  has_many :messages, as: :owner, dependent: :destroy
  has_many :communications, as: :user, dependent: :destroy
  has_many :conversations, through: :communications
end
