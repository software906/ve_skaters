class Booking < ApplicationRecord
  belongs_to :skate
  belongs_to :user
  validates :time_from, :descripcion, presence: true
  validates :time_from, uniqueness: { scope: :skate_id, scope: :status,
    message: "fecha ya alquilada" }
end
