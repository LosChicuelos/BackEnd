class AddAuthenticationTokenToAuthentications < ActiveRecord::Migration[5.1]
  def change
    add_column :authentications, :authentication_token, :string, limit: 30
    add_index :authentications, :authentication_token, unique: true
  end
end
