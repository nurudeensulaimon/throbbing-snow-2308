
# User Story 1, Flights Index Page


# I see a list of all flight numbers
# And under each flight number I see the names of all that flight's passengers

# User Story 1, Flights Index Page
require 'rails_helper'
RSpec.describe "Flight Index Page" do 

  it "sees the lists of all flights numbers" do 

    airline_1= Airline.create!(name:"Delta")

    flight_1=airline_1.flights.create!(number:"A01", date:"01FEB24", departure_city:"Norfolk",arrival_city:"Houston")
    flight_2=airline_1.flights.create!(number:"A02", date:"01FEB24", departure_city:"Norfolk",arrival_city:"New York")
    flight_3=airline_1.flights.create!(number:"A03", date:"01FEB24", departure_city:"Norfolk",arrival_city:"Washington")

    passenger_1=Passenger.create!(name:"Joe",age:21)
    passenger_2=Passenger.create!(name:"Tom", age:22)
    passenger_3=Passenger.create!(name:"Rob", age:23)
    passenger_4=Passenger.create!(name:"Sam", age:24)

    FlightPassenger.create!(flight_id:flight_1.id, passenger_id:passenger_1.id)
    FlightPassenger.create!(flight_id:flight_1.id, passenger_id:passenger_2.id)
    FlightPassenger.create!(flight_id:flight_2.id, passenger_id:passenger_3.id)
    FlightPassenger.create!(flight_id:flight_3.id, passenger_id:passenger_4.id)

 
    # As a visitor
    # When I visit the flights index page
    # And next to each flight number
     #I see the name of the Airline of that flight

    visit "/flights"
      within("#flight-#{flight_1.id}") do
      # I see a list of all flight numbers
      expect(page).to have_content("Flight Number:#{flight_1.number}, Airline:#{flight_1.airline}")
      expect(page).to have_content("Flight Passenger: #{passenger.name}")

    end   
      within("#flight-#{flight_2.id}") do
      expect(page).to have_content("Flight Number:#{flight_2.number}, Airline:#{flight_1.airline}")
      expect(page).to have_content("Flight Passenger: #{passenger.name}")
    end
      within("#flight-#{flight_3.id}") do
      expect(page).to have_content("Flight Number:#{flight_3.number}, Airline:#{flight_1.airline}")
      expect(page).to have_content("Flight Passenger:#{passenger.name}")
    end
  end
end