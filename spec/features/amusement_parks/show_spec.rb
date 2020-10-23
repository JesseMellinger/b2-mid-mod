require 'rails_helper'

describe "as a visitor" do
  before :each do
    @amusement_park_1 = AmusementPark.create!(name: "Hersheypark",
                                              admission_price: 50.00)

    @amusement_park_2 = AmusementPark.create!(name: "Dollywood",
                                              admission_price: 80.00)

    @amusement_park_3 = AmusementPark.create!(name: "Cedar Point",
                                              admission_price: 40.00)

    @ride_1 = Ride.create!(name: "Lightning Racer",
                           thrill_rating: 8,
                           amusement_park_id: @amusement_park_1.id)

    @ride_2 = Ride.create!(name: "Storm Runner",
                           thrill_rating: 7,
                           amusement_park_id: @amusement_park_1.id)

    @ride_3 = Ride.create!(name: "The Great Bear",
                           thrill_rating: 6,
                           amusement_park_id: @amusement_park_1.id)

  end
  describe "when I visit an amusement park’s show page" do
    it "I see the name and price of admissions for that amusement park, and I see the names of all the rides that are at that park, and I see the average thrill rating of this amusement park’s rides"
      visit("amusementparks/#{@amusement_park_1.id}")

      expect(page).to have_content("#{@amusement_park_1.name}")
      expect(page).to have_content("Admissions: $#{@amusement_park_1.admission_price}")

      within("#rides") do
        expect(page).to have_content("Rides:")
        within("#ride-#{@ride_1.id}") do
          expect(page).to have_content("#{@ride_1.name}")
        end
        within("#ride-#{@ride_2.id}") do
          expect(page).to have_content("#{@ride_2.name}")
        end
        within("#ride-#{@ride_3.id}") do
          expect(page).to have_content("#{@ride_3.name}")
        end
      end

      expect(page).to have_content("Average Thrill Rating of Rides: #{@amusement_park_1.average_thrill_rating_of_rides}/10")
  end
end
