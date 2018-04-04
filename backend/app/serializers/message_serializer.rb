class MessageSerializer < ActiveModel::Serializer
  attributes :id, :topic, :content, :sender_id, :receiver_id, :created_at
end
