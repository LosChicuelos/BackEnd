# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  date       :date
#  quantity   :integer
#  amount     :decimal(, )
#  seller_id  :integer
#  buyer_id   :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sale < ApplicationRecord
  has_one :seller, :class_name => "User"
  has_one :buyer, :class_name => "User"
#  belongs_to :article
  has_many :scores

  validates :date, presence: true
#  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :amount, presence: true, numericality: true
  
end
