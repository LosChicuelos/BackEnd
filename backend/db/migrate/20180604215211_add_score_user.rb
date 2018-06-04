class AddScoreUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :score, :decimal
  end
end
