class Booking < ApplicationRecord
  belongs_to :skate
  belongs_to :user
end
