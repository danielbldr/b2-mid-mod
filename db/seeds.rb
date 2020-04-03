# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mechanic.create(name: 'Meg Stang', years_of_experience: 5)
Mechanic.create(name: 'Corey Westerfield', years_of_experience: 2)
Mechanic.create(name: 'Mike Dao', years_of_experience: 4)

amusement_park1 = AmusementPark.create(name: 'Six Flags', admission_price: 50)
amusement_park2 = AmusementPark.create(name: 'Lakeside', admission_price: 10)
amusement_park3 = AmusementPark.create(name: 'DisneyLand', admission_price: 100)

amusement_park1.rides.create(name:'Mr. Twister', thrill_rating: 8)
amusement_park1.rides.create(name:'Sidebender', thrill_rating: 10)
amusement_park1.rides.create(name:'Tower of Doom', thrill_rating: 7)
amusement_park1.rides.create(name:'Cups', thrill_rating: 2)

amusement_park2.rides.create(name:'The Hulk', thrill_rating: 6)
amusement_park2.rides.create(name:'SpiderMan', thrill_rating: 8)
amusement_park2.rides.create(name:'Batman', thrill_rating: 3)
amusement_park2.rides.create(name:'Superman', thrill_rating: 4)

amusement_park3.rides.create(name:'Soaring of California', thrill_rating: 3)
amusement_park3.rides.create(name:'Winnie the Pooh', thrill_rating: 2)
amusement_park3.rides.create(name:'Its a Small World Afterall', thrill_rating: 1)
amusement_park3.rides.create(name:'Peter Pan', thrill_rating: 4)
