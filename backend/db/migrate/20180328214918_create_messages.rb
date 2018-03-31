class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :topic
      t.text :content
      t.date :date
      t.references :sender
      t.references :receiver

      t.timestamps
    end
  end
end
