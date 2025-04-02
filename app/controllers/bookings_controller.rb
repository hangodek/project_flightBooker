class BookingsController < ApplicationController
  def new
  end

  def create
    if authenticated?
      user_email = Current.user.email_address
    end

    user = User.find_by(email_address: user_email)
    user.flights.push(Flight.find(params[:flight_id]))
  end
end
