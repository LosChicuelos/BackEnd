# == Schema Information
#
# Table name: articles
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  price             :decimal(, )
#  inventory         :integer
#  user_id           :integer
#  classification_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Article < ApplicationRecord
#  belongs_to :user
  belongs_to :classification
  has_many :photos
  has_many :questions
  has_many :sales

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :inventory, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  
#  scope :highprice, -> { where("price > ?",50000)}
end
