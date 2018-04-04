class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :inventory, :user_id, :classification_id
end
