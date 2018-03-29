class Message < ApplicationRecord
  has_one :sender, :class_name => "User"
  has_one :receiver, :class_name => "User"

  validates :topic, presence: true, length: { minimum: 5, maximum: 50 }
  validates :content, presence: true, length: { minimum: 10, maximum: 500 }
  validates :date, presence: true
end
