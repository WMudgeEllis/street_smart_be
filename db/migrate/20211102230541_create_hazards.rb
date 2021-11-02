class CreateHazards < ActiveRecord::Migration[5.2]
  def change
    create_table :hazards do |t|
      t.string :title
      t.string :description
      t.integer :type
      t.string :longitude
      t.string :latitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
