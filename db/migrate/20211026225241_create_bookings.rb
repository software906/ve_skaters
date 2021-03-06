class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :skate, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :price_total
      t.date :time_from
      t.timestamp :time_to
      t.boolean :status, default: true
      t.boolean :compled, default: false
      t.text :descripcion

      t.timestamps
    end
  end
end
