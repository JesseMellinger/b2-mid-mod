require 'rails_helper'

describe "as a user" do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Geordi La Forge",
                                   years_of_experience: 25)

    @amusement_park_1 = AmusementPark.create!(name: "Hersheypark",
                                              admission_price: 50.00)

    @ride_1 = Ride.create!(name: "Lightning Racer",
                           thrill_rating: 8,
                           amusement_park_id: @amusement_park_1.id)

    @ride_2 = Ride.create!(name: "Storm Runner",
                           thrill_rating: 7,
                           amusement_park_id: @amusement_park_1.id)

    @ride_3 = Ride.create!(name: "The Great Bear",
                           thrill_rating: 6,
                           amusement_park_id: @amusement_park_1.id)

    @ride_4 = Ride.create!(name: "The Great Bear",
                           thrill_rating: 6,
                           amusement_park_id: @amusement_park_1.id)

    RideMechanic.create!(mechanic_id: @mechanic_1.id,
                         ride_id: @ride_1.id)

    RideMechanic.create!(mechanic_id: @mechanic_1.id,
                         ride_id: @ride_2.id)

    RideMechanic.create!(mechanic_id: @mechanic_1.id,
                         ride_id: @ride_3.id)
  end
  describe "when I go to a mechanics show page" do
    it "I see their name, years of experience, and names of all rides they’re working on" do
      visit("/mechanics/#{@mechanic_1.id}")

      expect(page).to have_content("Mechanic: #{@mechanic_1.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic_1.years_of_experience}")
      within("#rides") do
        expect(page).to have_content("Current rides they're working on:")
        expect(page).to have_content("#{@ride_1.name}")
        expect(page).to have_content("#{@ride_2.name}")
        expect(page).to have_content("#{@ride_3.name}")
      end
    end
    describe "I also see a form to add a ride to their workload" do
      describe "when I fill in that field with an id of a ride that exists in the database and I click Submit" do
        it "I’m taken back to that mechanics show page and I see the name of that newly added ride on this mechanics show page" do
          visit("/mechanics/#{@mechanic_1.id}")

          fill_in("Id", with: "#{@ride_4.id}" )

          click_on("Submit")

          expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")

          within("#rides") do
            expect(page).to have_content("Current rides they're working on:")
            expect(page).to have_content("#{@ride_1.name}")
            expect(page).to have_content("#{@ride_2.name}")
            expect(page).to have_content("#{@ride_3.name}")
            expect(page).to have_content("#{@ride_4.name}")
          end
        end
      end
    end
  end
end
