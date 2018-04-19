class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :typeuser
      t.string :iddocument
      t.string :typedocument
      t.string :email
      t.string :phone
      t.string :latitude
      t.string :langitude
      t.string :password

      t.timestamps
    end
  end
end
