# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed airport names
airport_codes = [ "NYC", "SFC", "IDN", "SPR" ]
airport_codes.each do |airport|
  Airport.create(code: airport)
end

# Seed flights
flight_names = [ "Testing1", "Testing2", "Testing3", "Testing4" ]
flight_names.each do |flight|
  Flight.create(name: flight, departure_airport: Airport.first, arrival_airport: Airport.second)
end

# Seed user
dummy_address = [ "blabla@gmail.com", "makan@gmail.com", "mama@gmail.com" ]
random = Random.new

dummy_address.each do |dummy_address|
  User.create(email_address: dummy_address, password: random.rand(1234).to_s)
end
