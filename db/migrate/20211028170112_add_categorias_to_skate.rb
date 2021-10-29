class AddCategoriasToSkate < ActiveRecord::Migration[6.0]
  def change
    add_column :skates, :categoria, :string
  end
end
