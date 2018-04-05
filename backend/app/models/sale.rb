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
  belongs_to :article
  has_many :scores

  validates :date, presence: true
  validates :quantity, presence: true, numericality:  true 
  validates :amount, presence: true, numericality: true
  
  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).

  #Este query nos devuelve las compras que a realizado un usurario.
  scope :purchases_per_user, ->(id_param) { where("buyer_id = ?", id_param)}

  #Este query nos devuelve las ventas que a realizado un usurario.
  scope :sales_per_user, ->(id_param) { where("seller_id = ?", id_param)}

end
