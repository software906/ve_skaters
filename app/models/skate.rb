class Skate < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :precio_dia, :ubicacion, :photos, :descripcion, presence: true

  scope :filter_by_price_desc, -> { order(precio_dia: :desc) }
  scope :filter_by_price_asc, -> { order(precio_dia: :asc) }
  scope :location, -> { order(ubicacion: :asc) }

end
