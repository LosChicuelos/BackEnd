json.extract! sale, :id, :date, :quantity, :amount, :seller_id, :buyer_id, :article_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
