class FlightsController < ApplicationController
  allow_unauthenticated_access only: %i[index]

  def index
    departure_airport_params = Airport.find_by(code: params[:departure_airport])
    arrival_airport_params = Airport.find_by(code: params[:arrival_airport])
    passengers_params = params[:number_of_passengers].to_i
    flights = Flight.where(departure_airport: departure_airport_params, arrival_airport: arrival_airport_params)
    @flights_filtered = flights.select { |flight| flight.passengers.length == passengers_params }
  end
end
