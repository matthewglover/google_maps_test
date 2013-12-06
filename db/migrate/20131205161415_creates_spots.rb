class CreatesSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :keywords

      t.timestamps
    end
    add_reference :spots, :place, index: true
  end
end
