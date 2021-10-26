class Skate < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :precio_dia, :ubicacion, :photos, :descripcion, presence: true
end
