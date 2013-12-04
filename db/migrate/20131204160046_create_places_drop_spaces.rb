class CreatePlacesDropSpaces < ActiveRecord::Migration
  def change
    drop_table :spaces
    create_table :places do |t|
      t.string :factual_id
      t.string :name
      t.string :telephone
      t.string :address
      t.string :postcode
      t.string :region
      t.string :country
      t.float :lat
      t.float :lng

      t.timestamps
    end
    add_index :places, :factual_id
    add_index :places, :name
    add_index :places, [:lat, :lng]
  end
end
