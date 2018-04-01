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

class Message < ApplicationRecord
  has_one :sender, :class_name => "User"
  has_one :receiver, :class_name => "User"

  validates :topic, presence: true, length: { minimum: 5, maximum: 50 }
  validates :content, presence: true, length: { minimum: 10, maximum: 500 }
  validates :date, presence: true
  
  def self.belongsalliance(userid1,userid2)
    joins(:user).where("classifications.name = ?",classificationname)
  end
end
