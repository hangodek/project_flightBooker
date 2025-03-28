class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :user_flights
  has_many :flights, through: :user_flights

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
