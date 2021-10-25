class CreateSkates < ActiveRecord::Migration[6.0]
  def change
    create_table :skates do |t|
      t.integer :precio_dia
      t.text :descripcion
      t.text :ubicacion
      t.boolean :status, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
