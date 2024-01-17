class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers 
  def adult_passenger
     Passenger.where(:age => 18)
  end

  def unique_passenger 
    Passenger.distinct.pluck(:name)
  end
end