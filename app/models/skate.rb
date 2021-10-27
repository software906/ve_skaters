class Skate < ApplicationRecord
  belongs_to :user
  has_many :booking
  has_many_attached :photos
  has_many :reviews
  validates :precio_dia, :ubicacion, :photos, :descripcion, presence: true

  geocoded_by :ubicacion
  after_validation :geocode, if: :will_save_change_to_ubicacion?

  scope :filter_by_price_desc, -> { order(precio_dia: :desc) }
  scope :filter_by_price_asc, -> { order(precio_dia: :asc) }
  scope :location, -> { order(ubicacion: :asc) }

end
