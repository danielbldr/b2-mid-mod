require 'rails_helper'

RSpec.describe 'as a user' do
  it 'can visit mechanics index page and see list of all mechanics info' do
    mechanic1 = Mechanic.create(name: 'Meg Stang', years_of_experience: 5)
    mechanic2 = Mechanic.create(name: 'Corey Westerfield', years_of_experience: 2)
    mechanic3 = Mechanic.create(name: 'Mike Dao', years_of_experience: 4)

    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
    within(".mechanic-info") do
      expect(page).to have_content("#{mechanic1.name} - #{mechanic1.years_of_experience} years of experience")
      expect(page).to have_content("#{mechanic2.name} - #{mechanic2.years_of_experience} years of experience")
      expect(page).to have_content("#{mechanic3.name} - #{mechanic3.years_of_experience} years of experience")
    end
  end
end
