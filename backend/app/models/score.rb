# == Schema Information
#
# Table name: scores
#
#  id           :integer          not null, primary key
#  commentary   :text
#  score        :integer
#  sale_id      :integer
#  qualified_id :integer
#  qualifier_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_scores_on_qualified_id  (qualified_id)
#  index_scores_on_qualifier_id  (qualifier_id)
#  index_scores_on_sale_id       (sale_id)
#

class Score < ApplicationRecord
  belongs_to :sale
  has_one :qualified, :class_name => "User"
  has_one :qualifier, :class_name => "User"

  validates :commentary, presence: true, length: { maximum: 500 }
  validates :score, presence: true, numericality: { only_integer: true }, length: { maximum: 1 }
  
  scope :paginatedef, -> (param){
      Score.paginate(:page => param, :per_page => 6)
  }

  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).

  #Este query nos devuelve las calificaciones mayores a un determinado numero.
  scope :higherthan, -> (param) { where("score > ?",param)}
  
  scope :counthigherthan, -> (param) { where("score > ?",param).count} 
  
  #Este query nos devuelve las calificaciones creadas antes de una fecha.
  scope :created_before, ->(param) { 
    if param != nil
      where("scores.created_at <= ?", param)
    else
      all
    end
    }
  #Este query nos devuelve las calificaciones creadas despues de una fecha.
  scope :created_after, ->(param) { 
    if param != nil
      where("scores.created_at >= ?", param)
    else
      all
    end
    }
  #Para obtener las calificaciones creadas entre un rango de fechas, solo se necesita anidar los 2 queries anteriores.
  
  #Este query nos devuelve las calificaciones como comprador de un usuario especifico, realizando la búsqueda por id.
  scope :buyer_belongsuserid, ->(param){ where(" qualified_id = ?",param)}
  
  #Este query nos agrupa por rango de calificaciones.
  scope :group_rank, -> { group('score / 1')}

end
