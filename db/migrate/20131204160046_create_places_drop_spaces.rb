class CreatePlacesDropSpaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :factual_id, null: true
      t.string :name, null: false
      t.string :telephone, null: true
      t.string :address, null: true
      t.string :postcode, null: true
      t.string :region, null: true
      t.string :country, null: true
      t.float :lat, null: true
      t.float :lng, null: true

      t.timestamps
    end
    add_index :places, :factual_id, unique: true
    add_index :places, :name
    add_index :places, [:lat, :lng]
  end
end
