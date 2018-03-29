json.extract! photo, :id, :date, :photo, :article_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
