require 'rails_helper'

RSpec.describe 'as a user' do
  describe 'can visit an amusement parks show page' do
    it 'can see the name and price of admission, all rides in alphabetical order, and the average thrill rating' do
      amusement_park1 = AmusementPark.create(name: 'Six Flags', admission_price: 50)

      ride1 = amusement_park1.rides.create!(name:'Mr. Twister', thrill_rating: 8)
      ride2 = amusement_park1.rides.create!(name:'Sidebender', thrill_rating: 10)
      ride3 = amusement_park1.rides.create!(name:'Tower of Doom', thrill_rating: 7)

      visit "/amusement_parks/#{amusement_park1.id}"

      expect(page).to have_content(amusement_park1.name)
      expect(page).to have_content("Admissions: $#{amusement_park1.admission_price}.00")
      within(".ride-#{ride1.id}") do
        expect(page).to have_content(ride1.name)
      end

      within(".ride-#{ride2.id}") do
        expect(page).to have_content(ride2.name)
      end

      within(".ride-#{ride3.id}") do
        expect(page).to have_content(ride3.name)
      end

      expect(page).to have_content("Average Thrill Rating of Rides: #{amusement_park1.average_thrill_rating}/10")
    end
  end
end
