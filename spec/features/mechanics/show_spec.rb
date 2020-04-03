require 'rails_helper'

RSpec.describe 'as a user' do
  describe 'can visit mechanics show page' do
    it 'can see name, years of experience, rides theyre working on, and form to add ride to workload' do
      mechanic1 = Mechanic.create(name: 'Meg Stang', years_of_experience: 5)

      amusement_park1 = AmusementPark.create(name: 'Six Flags', admission_price: 50)

      ride1 = amusement_park1.rides.create(name:'Mr. Twister', thrill_rating: 8)
      ride2 = amusement_park1.rides.create(name:'Sidebender', thrill_rating: 10)
      ride3 = amusement_park1.rides.create(name:'Tower of Doom', thrill_rating: 7)

      MechanicRide.create(mechanic_id: mechanic1.id, ride_id: ride1.id)
      MechanicRide.create(mechanic_id: mechanic1.id, ride_id: ride2.id)

      visit "/mechanics/#{mechanic1.id}"

      expect(page).to have_content("Mechanic: #{mechanic1.name}")
      expect(page).to have_content("Years of Expereince: #{mechanic1.years_of_experience}")

      within(".mechanic-rides") do
        expect(page).to have_content("#{ride1.name}")
        expect(page).to have_content("#{ride2.name}")
      end

      within(".work-form") do
        fill_in(:ride, with: "#{ride3.id}")
        click_button("Submit")
      end

      expect(current_path).to eq("/mechanics/#{mechanic1.id}")
      within(".mechanic-rides") do
        expect(page).to have_content("#{ride1.name}")
        expect(page).to have_content("#{ride2.name}")
        expect(page).to have_content("#{ride3.name}")
      end
    end
  end
end
