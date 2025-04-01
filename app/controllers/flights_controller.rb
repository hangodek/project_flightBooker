class FlightsController < ApplicationController
  allow_unauthenticated_access only: %i[index new create]

  def index
    departure_airport_params = Airport.find_by(code: params[:departure_airport])
    arrival_airport_params = Airport.find_by(code: params[:arrival_airport])
    passengers_params = params[:number_of_passengers].to_i
    date_params = params[:date]
    flights = Flight.where(departure_airport: departure_airport_params, arrival_airport: arrival_airport_params, date: params[:date])
    @flights_filtered = flights.select { |flight| flight.passengers.length == passengers_params }
  end

  def new
    @flight = Flight.new
  end

  def create
    departure_airport = Airport.find_by(code: params[:flight][:departure_airport])
    arrival_airport = Airport.find_by(code: params[:flight][:arrival_airport])

    @flight = Flight.create(
      name: params[:flight][:name],
      departure_airport: departure_airport,
      arrival_airport: arrival_airport,
      date: params[:flight][:date]
    )

    if @flight.save
      redirect_to flights_path
    else
      render :new, status: :unprocessable_identity
    end
  end

  private

  def flight_params
    params.expect(flight: [ :departure_airport, :arrival_airport, :date ])
  end
end
