class AmusementPark < ApplicationRecord
  has_many :rides

  def average_thrill_rating
    self.rides.average(:thrill_rating).round(2)
  end
end
