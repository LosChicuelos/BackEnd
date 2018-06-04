# == Schema Information
# Schema version: 20180511095855
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  name               :string
#  description        :text
#  price              :decimal(, )
#  inventory          :integer
#  user_id            :integer
#  classification_id  :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#
# Indexes
#
#  index_articles_on_classification_id  (classification_id)
#  index_articles_on_user_id            (user_id)
#

class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :inventory, :user_id, :classification_id, :picture_file_name
end
