class AddPublicProfileValidation2 < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :public_status, :boolean
  end
end
