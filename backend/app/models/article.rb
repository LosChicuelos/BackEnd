class Article < ApplicationRecord
  belongs_to :user
  belongs_to :classification
  has_many :photos
  has_many :questions
  has_many :sales

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :inventory, presence: true, numericality: true
  validates :price, presence: true, numericality: { only_integer: true }
end
