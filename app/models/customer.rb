# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :messages, as: :owner, dependent: :destroy
  has_many :communications, as: :user, dependent: :destroy
  has_many :conversations, through: :communications
  has_many :ratings, dependent: :destroy
end
