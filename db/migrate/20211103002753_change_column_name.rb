class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :hazards, :type, :category
  end
end
