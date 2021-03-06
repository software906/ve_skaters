class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating, default: 0
      t.references :skate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
