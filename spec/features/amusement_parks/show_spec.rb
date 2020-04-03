require 'rails_helper'

RSpec.describe 'as a user' do
  it 'can visit an amusement parks show page' do
    it 'can see the name and price of admission, all rides in alphabetical order, and the average thrill rating' do
      amusement_park1 = AmusementPark.create(name: 'Six Flags', admission_price: 50)

      ride1 = amusement_park1.rides.create(name:'Mr. Twister', thrill_rating: 8)
      ride2 = amusement_park1.rides.create(name:'Sidebender', thrill_rating: 10)
      ride3 = amusement_park1.rides.create(name:'Tower of Doom', thrill_rating: 7)

      visit '/amusement_parks/1'

      expect(page).to have_content(amusement_park1.name)
      expect(page).to have_content("Admissions: $#{amusement_park1.admission_price.to_f}")
      within(".ride-info") do
        expect(page).to have_content(ride1.name)
        expect(page).to have_content(ride2.name)
        expect(page).to have_content(ride3.name)
        expect(page).to have_content("Average Thrill Rating of Rides: #{amusement_park1.average_thrill_rating}/10")
      end
    end
  end
end


# Story 2
# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
#
# Ex: Hershey Park
#     Admissions: $50.00
#
#     Rides:
#            1. Lightning Racer
#            2. Storm Runner
#            3. The Great Bear
#
#     Average Thrill Rating of Rides: 7.8/10
#
