class AmusementPark < ApplicationRecord
  has_many :rides

  def average_thrill_rating_of_rides
    rides.average(:thrill_rating)
  end
end
