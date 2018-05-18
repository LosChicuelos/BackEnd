class AddPictureToArticles < ActiveRecord::Migration[5.1]
  def up
  	add_attachment :articles, :picture
  end

  def down
  	remove_attachment :articles, :picture
  end
end
