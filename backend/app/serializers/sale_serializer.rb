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

class SaleSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :amount, :seller_id, :buyer_id, :created_at
end
