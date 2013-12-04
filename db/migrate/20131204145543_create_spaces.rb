class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
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
    add_index :spaces, :factual_id
    add_index :spaces, :name
    add_index :spaces, [:lat, :lng]
  end
end
