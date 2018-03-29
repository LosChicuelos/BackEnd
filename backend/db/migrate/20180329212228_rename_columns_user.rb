class RenameColumnsUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :type, :typeuser
    change_column :users, :latitude, :decimal
    change_column :users, :langitude, :decimal
  end
end
