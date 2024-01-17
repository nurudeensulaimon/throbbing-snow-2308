# User Story 3, Airline's Passengers

# As a visitor
# When I visit an airline's show page
# Then I see a list of passengers that have flights on that airline
# And I see that this list is unique (no duplicate passengers)
# And I see that this list only includes adult passengers.

# (Note: an adult is anyone with age greater than or equal to 18)

require 'rails_helper'
RSpec.describe "Airline Show Page" do 

  it "sees the lists of passengers that have flights" do 

    airline_1= Airline.create!(name:"Delta")
    airline_2=Airline.create!(name:"Spirit")

    flight_1=airline_1.flights.create!(number:"A01", date:"01FEB24", departure_city:"Norfolk",arrival_city:"Houston")
    flight_2=airline_1.flights.create!(number:"A02", date:"01FEB24", departure_city:"Norfolk",arrival_city:"New York")
    flight_3=airline_1.flights.create!(number:"A03", date:"01FEB24", departure_city:"Norfolk",arrival_city:"Washington")

    passenger_1=Passenger.create!(name:"Joe",age:21)
    passenger_2=Passenger.create!(name:"Tom", age:22)
    passenger_3=Passenger.create!(name:"Rob", age:23)
    passenger_4=Passenger.create!(name:"Sam", age:24)
    passenger_5=Passenger.create!(name:"Reich",age:11)
    passenger_6=Passenger.create!(name:"Sam", age:24)


    FlightPassenger.create!(flight_id:flight_1.id, passenger_id:passenger_1.id)
    FlightPassenger.create!(flight_id:flight_1.id, passenger_id:passenger_2.id)
    FlightPassenger.create!(flight_id:flight_2.id, passenger_id:passenger_3.id)
    FlightPassenger.create!(flight_id:flight_3.id, passenger_id:passenger_4.id)

    visit "/airlines/#{airline_1.id}"
      expect(page).to have_content("Passenger name: #{passenger_1.name}")
      expect(page).to have_content("Passenger name: #{passenger_2.name}")
      expect(page).to have_content("Passenger name: #{passenger_3.name}")
      expect(page).to have_content("Passenger name: #{passenger_4.name}")
    end

      it "does have passsenger age greater or equal to 18" do
          within("#adult passenger") do
      expect(page).to have_content("Adult Passenger:#{passenger_1.name}")
      expect(page).to have_content("Adult Passenger:#{passenger_2.name}")
      expect(page).to have_content("Adult Passenger:#{passenger_3.name}")
      expect(page).to have_content("Adult Passenger:#{passenger_4.name}")
      expect(page).to_not have_content("Adult Passenger:#{passenger_5.name}")
        end 
      end
     
      it " has a unique passenger" do 
          within("#unique passenger") do
      expect(page).to have_content("Adult Passenger:#{passenger_1.name}")
      expect(page).to have_content("Adult Passenger:#{passenger_2.name}")
      expect(page).to have_content("Adult Passenger:#{passenger_3.name}")
      expect(page).to have_content("Adult Passenger:#{passenger_4.name}")
        end
    end
end