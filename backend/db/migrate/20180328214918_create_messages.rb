class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :topic
      t.text :content
      t.date :date
      t.references :sender, foreign_key: true
      t.references :receiver, foreign_key: true

      t.timestamps
    end
  end
end
