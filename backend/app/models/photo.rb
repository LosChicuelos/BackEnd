# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  date       :date
#  photo      :binary
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  photos     :string
#
# Indexes
#
#  index_photos_on_article_id  (article_id)
#

class Photo < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :article

  validates :date, presence: true
  validates :photo, presence: true

  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).
  
  #Este query nos devuelve todas las fotos de un producto.
  scope :photos_by_article, ->(id_param) { where("article_id = ?", id_param)}

end
