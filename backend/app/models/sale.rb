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
# Indexes
#
#  index_sales_on_article_id  (article_id)
#  index_sales_on_buyer_id    (buyer_id)
#  index_sales_on_seller_id   (seller_id)
#

class Sale < ApplicationRecord
  has_one :seller, :class_name => "User"
  has_one :buyer, :class_name => "User"
  belongs_to :article
  has_many :scores

  validates :date, presence: true
  validates :quantity, presence: true, numericality:  true 
  validates :amount, presence: true, numericality: true
    
  scope :paginatedef, -> (param){
      Sale.paginate(:page => param, :per_page => 6)
  }
    
  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).
  
  def self.sale_sent_by_user2(param)
    messas = Message.messages_sent_by_user(param);
    messas.each do |message|
      message.receivertemp = message.receiver
    end
    messas2 = messas
#    messas2.each { |x| puts x.sendertemp }
  end
  
  #Este query nos devuelve las ventas donde los productos tienen un precio igual o mayor que el parámetro de entrada.
  scope :higher_price_than, ->(param) { 
    if param != nil
      where("amount/quantity >= ?", param)
    else
      all
    end
    }
  #Este query nos devuelve las ventas donde los productos tienen un precio igual o menor que el parámetro de entrada.
  scope :lower_price_than, ->(param) { 
    if param != nil
      where("amount/quantity <= ?", param)
    else
      all
    end
    }
  #Para obtener artículos entre un rango de precios, solo se necesita anidar los 2 queries anteriores.
  
  #Este query nos devuelve las compras que a realizado un usurario.
  scope :purchases_per_user, ->(param) { 
    if param != nil
      where("buyer_id = ?", param)
    else
      all
    end
    }

  #Este query nos devuelve las ventas que a realizado un usurario.
  scope :sales_per_user, ->(param) { 
    if param != nil
      where("seller_id = ?", param)
    else
      all
    end
    }

  #Este query nos devuelve las compras/ventas creadas antes de una fecha.
  scope :created_before, ->(param) { 
    if param != nil
      where("created_at <= ?", param)
    else
      all
    end
    }
  #Este query nos devuelve las compras/ventas creadas despues de una fecha.
  scope :created_after, ->(param) { 
    if param != nil
      where("created_at >= ?", param)
    else
      all
    end
    }
  #Para obtener compras entre un rango de fechas, solo se necesita anidar los 2 queries anteriores.

end
