class Question < ApplicationRecord
  belongs_to :user
  belongs_to :article
  
  validates :date, presence: true
  validates :question, presence: true, length: { minimum: 5, maximum: 200 }
end
