class Skate < ApplicationRecord
  attr_accessor :user_skate_pos
  
  include PgSearch::Model
  belongs_to :user
  has_many :booking
  has_many_attached :photos
  has_many :reviews
  validates :precio_dia, :ubicacion, :photos, :descripcion, :categoria, presence: true

  geocoded_by :ubicacion
  after_validation :geocode, if: :will_save_change_to_ubicacion?

  scope :filter_by_price_desc, -> { order(precio_dia: :desc) }
  scope :filter_by_price_asc, -> { order(precio_dia: :asc) }
  scope :location, -> { order(ubicacion: :asc) }
  scope :search, -> { where("ubicacion LIKE ?", "%#{params[:search]}%") }
  #scope :filter_by_search, -> (ubicacion) { where("ubicacion like ?", "%#{ubicacion}%")}
  scope :filter_by_zona, -> (zona) { where("ubicacion like ?", "%#{zona}%")}

  scope :filter_by_categoria, -> (categoria) { where("categoria like ?", "%#{categoria}%")}
  pg_search_scope :search_by_ubicacion_and_descripcion,
    against: [ :ubicacion, :descripcion ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
