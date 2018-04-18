class AddAvatarToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :photos, :string
  end
end
