require 'rails_helper'

describe AmusementPark, type: :model do
  describe 'relationships' do
    it {should have_many :rides}
  end

  describe "instance methods" do
    it "#average_thrill_rating_of_rides" do
      @amusement_park_1 = AmusementPark.create!(name: "Hersheypark",
                                                admission_price: 50.00)

      @ride_1 = Ride.create!(name: "Lightning Racer",
                             thrill_rating: 8,
                             amusement_park_id: @amusement_park_1.id)

      @ride_2 = Ride.create!(name: "Storm Runner",
                             thrill_rating: 7,
                             amusement_park_id: @amusement_park_1.id)

      @ride_3 = Ride.create!(name: "The Great Bear",
                             thrill_rating: 5,
                             amusement_park_id: @amusement_park_1.id)

      expect(@amusement_park_1.average_thrill_rating_of_rides.to_f.round(1)).to eq(6.7)
    end
  end
end
