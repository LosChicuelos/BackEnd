class Sale < ApplicationRecord
  has_one :seller, :class_name => "User"
  has_one :buyer, :class_name => "User"
  belongs_to :article
  has_many :scores

  validates :date, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :amount, presence: true, numericality: { only_integer: true }
  
end
