class AddFileToPhotos < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :photos, :file
  end
end
