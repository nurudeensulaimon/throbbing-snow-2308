require "rails_helper"

RSpec.describe Passenger, type: :model do
  describe "relationships" do
    it { should have_many :flight_passengers}
    it { should have_many(:flights).through(:flight_passengers)}
  end

  describe "#adult_passenger" do 
    it "selects only adult passenger" do 

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
   
    expect(Passenger.adult_passenger).to eq([passenger+_1,passenger_2,passenger_3,passenger_4])
    end
  end

  describe "#adult_passenger" do 
    it "selects UNIQUE passenger" do 

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

    expect(Passenger.unique_passenger).to eq([passenger_1,passenger_2, passenger_3, passenger_4])
    end
end

