class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :user_flights
  has_many :passengers, through: :user_flights, source: :user
end
