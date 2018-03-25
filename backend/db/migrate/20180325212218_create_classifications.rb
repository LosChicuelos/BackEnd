class CreateClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :classifications do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
