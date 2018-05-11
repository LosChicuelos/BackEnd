# == Schema Information
# Schema version: 20180504054551
#
# Table name: photos
#
#  id                :integer          not null, primary key
#  date              :date
#  photo             :binary
#  article_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  photos            :string
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#
# Indexes
#
#  index_photos_on_article_id  (article_id)
#

class Photo < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :article, inverse_of: :photos

  has_attached_file \
    :photo,
    styles: { thumb: ['32x32#', 'jpg'] },
    convert_options: {
      all: '-interlace Plane'
    },
    default_url: '/images/default_:style_photo.png'

  validates_attachment_presence :photo
  validates_attachment_file_name :photo, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]


  validates :article_id, presence: true
  validates :photos, presence: true
  
    
  scope :paginatedef, -> (param){
      Photo.paginate(:page => param, :per_page => 6)
  }


  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).
  
  #Este query nos devuelve todas las fotos de un producto.
  scope :photos_by_article, ->(id_param) { where("article_id = ?", id_param)}

end
