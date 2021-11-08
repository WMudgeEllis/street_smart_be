class ChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :hazards, :latitude, :float, using: 'latitude::float'
    change_column :hazards, :longitude, :float, using: 'longitude::float'
  end
end
