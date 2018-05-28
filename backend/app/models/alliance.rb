# == Schema Information
#
# Table name: alliances
#
#  id           :integer          not null, primary key
#  commentary   :text
#  confirm      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  applicant_id :integer
#  approval_id  :integer
#
# Indexes
#
#  index_alliances_on_applicant_id  (applicant_id)
#  index_alliances_on_approval_id   (approval_id)
#

class Alliance < ApplicationRecord
  has_one :approval, :class_name => "User"
  has_one :applicant, :class_name => "User"

  validates :commentary, presence: true, length: { minimum: 5, maximum: 500 }
  validates :confirm, length: { minimum: 2, maximum: 10 }
  validates :applicant_id, presence: true
  validates :approval_id,  presence: true
  
    
  scope :paginatedef, -> (param){
      Alliance.paginate(:page => param, :per_page => 6)
  }

  
  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).

  #Este query nos devuelve las alianzas que fueron confirmadas.
  scope :alliance_positve, -> { where("confirm = ?", "SI")}

  #Este query nos devuelve las alianzas que no fueron confirmadas.
  scope :alliance_negative, -> { where("confirm = ?", "NO")}

  #Este query nos devuelve las alianzas creadas después de una fecha.
  scope :created_before, ->(time) { where("created_at <= ?", time)}
  #Este query nos devuelve las alianzas creadas antes de una fecha.
  scope :created_after, ->(time) { where("created_at > ?", time)}
  #Para obtener alianzas entre un rango de fechas, solo se necesita anidar los 2 queries anteriores.
  
  scope :belongsuser, ->(id_param) { where("(approval_id = ? or applicant_id = ?) and confirm = 'SI'", id_param,id_param)}
  scope :belongsuserpending, ->(id_param) { where("approval_id  = ? and confirm = 'PENDIENTE'",id_param)}
  scope :belongsuseronhold, ->(id_param) { where("applicant_id = ? and confirm = 'PENDIENTE'",id_param)}

  #Se deja en este comentaro multiple los querries anteriores
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
