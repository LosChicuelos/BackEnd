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

class PhotoSerializer < ActiveModel::Serializer
  attributes :id
end
