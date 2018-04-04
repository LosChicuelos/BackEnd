class SaleSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :amount, :seller_id, :buyer_id, created_at
end
