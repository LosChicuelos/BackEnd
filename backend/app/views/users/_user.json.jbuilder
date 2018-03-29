json.extract! user, :id, :type, :iddocument, :typedocument, :email, :phone, :latitude, :langitude, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
