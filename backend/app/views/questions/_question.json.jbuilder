json.extract! question, :id, :question, :answer, :date, :user_id, :article_id, :created_at, :updated_at
json.url question_url(question, format: :json)
