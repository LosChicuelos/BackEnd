class ChangeWrongTables < ActiveRecord::Migration[5.1]
  def change
    #rename_column :users, :type, :typeuser
    change_column :users, :latitude, :decimal
    change_column :users, :langitude, :decimal

    add_foreign_key :alliances, :users, column: :approval_id, primary_key: :id
    add_foreign_key :alliances, :users, column: :applicant_id, primary_key: :id

    add_foreign_key :messages, :users, column: :sender_id, primary_key: :id
    add_foreign_key :messages, :users, column: :receiver_id, primary_key: :id

    add_foreign_key :sales, :users, column: :seller_id, primary_key: :id
    add_foreign_key :sales, :users, column: :buyer_id, primary_key: :id

    add_foreign_key :scores, :users, column: :qualified_id, primary_key: :id
    add_foreign_key :scores, :users, column: :qualifier_id, primary_key: :id

  end
end
