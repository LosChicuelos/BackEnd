# == Schema Information
#
# Table name: alliances
#
#  id           :integer          not null, primary key
#  commentary   :text
#  confirm      :string
#  approval_id  :integer
#  applicant_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Alliance < ApplicationRecord
  has_one :approval, :class_name => "User"
  has_one :applicant, :class_name => "User"

  validates :commentary, presence: true, length: { minimum: 5, maximum: 500 }
  validates :confirm, length: { minimum: 2, maximum: 8 }
  
  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).

  #Este query nos devuelve cuantas alianzas fueron confirmadas.
  #query en proceso

  #Este query nos devuelve cuantas alianzas no fueron confirmadas.
  #query en proceso

  #Este query nos devuelve las alianzas creadas después de una fecha.
  scope :created_before, ->(time) { where("created_at <= ?", time)}
  #Este query nos devuelve las alianzas creadas antes de una fecha.
  scope :created_after, ->(time) { where("created_at > ?", time)}
  #Para obtener alianzas entre un rango de fechas, solo se necesita anidar los 2 queries anteriores.


  def self.withsale
    joins("
    INNER JOIN users  userapproval  ON alliances.approval_id  = userapproval.id 
    INNER JOIN users  userapplicant ON alliances.applicant_id = userapplicant.id
    INNER JOIN sales ON 
         (sales.seller_id = userapplicant.id AND sales.buyer_id = userapproval.id)
      OR (sales.seller_id = userapproval.id AND sales.buyer_id = userapplicant.id)"
    )
  end
  
  def self.countwithsale
    joins("
    INNER JOIN users  userapproval  ON alliances.approval_id  = userapproval.id 
    INNER JOIN users  userapplicant ON alliances.applicant_id = userapplicant.id
    INNER JOIN sales ON 
         (sales.seller_id = userapplicant.id AND sales.buyer_id = userapproval.id)
      OR (sales.seller_id = userapproval.id AND sales.buyer_id = userapplicant.id)"
    ).count()
  end  
end
