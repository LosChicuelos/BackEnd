json.extract! article, :id, :name, :description, :price, :inventory, :user_id, :classification_id, :created_at, :updated_at
json.url article_url(article, format: :json)
