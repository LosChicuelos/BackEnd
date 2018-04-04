class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer, :user_id, :article_id, :created_at
end
