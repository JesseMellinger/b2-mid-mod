require 'rails_helper'

describe "as a visitor" do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Geordi La Forge",
                                   years_of_experience: 25)

    @mechanic_2 = Mechanic.create!(name: "Fonzie",
                                   years_of_experience: 20)
  end
  describe "when I visit a mechanics index page" do
    it "I see a header saying 'All Mechanics' and I see a list of all mechanic’s names and their years of experience" do

      visit("/mechanics")

      expect(page).to have_content("All Mechanics")

      within("#mechanic-#{@mechanic_1.id}") do
        expect(page).to have_content("#{@mechanic_1.name} - #{@mechanic_1.years_of_experience} years of experience")
      end
      
      within("#mechanic-#{@mechanic_2.id}") do
        expect(page).to have_content("#{@mechanic_2.name} - #{@mechanic_2.years_of_experience} years of experience")
      end

    end
  end
end
