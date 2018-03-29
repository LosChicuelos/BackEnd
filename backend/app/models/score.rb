class Score < ApplicationRecord
  belongs_to :sale
  has_one :qualified, :class_name => "User"
  has_one :qualifier, :class_name => "User"

  validates :commentary, presence: true, length: { maximum: 500 }
  validates :score, presence: true, numericality: { only_integer: true }, length: { maximum: 1 }
  
end
