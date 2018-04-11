# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  topic       :string
#  content     :text
#  date        :date
#  sender_id   :integer
#  receiver_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MessageSerializer < ActiveModel::Serializer
  attributes :id, :topic, :content, :sender_id, :receiver_id, :created_at
end
