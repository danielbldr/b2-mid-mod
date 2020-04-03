require 'rails_helper'

RSpec.describe AmusementPark do
  describe "relationships" do
      it { should have_many :rides }
  end

  describe "#average_thrill_rating" do
    it 'can return average thrill rating of an amusement park' do
      amusement_park1 = AmusementPark.create(name: 'Six Flags', admission_price: 50)

      ride1 = amusement_park1.rides.create!(name:'Mr. Twister', thrill_rating: 8)
      ride2 = amusement_park1.rides.create!(name:'Sidebender', thrill_rating: 10)
      ride3 = amusement_park1.rides.create!(name:'Tower of Doom', thrill_rating: 7)

      expect(amusement_park1.average_thrill_rating).to eq(0.833e1)
    end
  end

  describe "#sorted_rides" do
    it 'can sort rides alphabetically' do
      amusement_park1 = AmusementPark.create(name: 'Six Flags', admission_price: 50)

      ride1 = amusement_park1.rides.create!(name:'Mr. Twister', thrill_rating: 8)
      ride2 = amusement_park1.rides.create!(name:'Sidebender', thrill_rating: 10)
      ride3 = amusement_park1.rides.create!(name:'Tower of Doom', thrill_rating: 7)
      ride4 = amusement_park1.rides.create(name:'Cups', thrill_rating: 2)

      expect(amusement_park1.sorted_rides).to eq([ride4, ride1, ride2, ride3])
    end
  end
end
