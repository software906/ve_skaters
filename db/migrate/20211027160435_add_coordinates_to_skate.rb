class AddCoordinatesToSkate < ActiveRecord::Migration[6.0]
  def change
    add_column :skates, :latitude, :float
    add_column :skates, :longitude, :float
  end
end
