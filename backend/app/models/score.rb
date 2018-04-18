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

  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).

  #Este query nos devuelve las calificaciones mayores a un determinado numero.
  scope :higherthan, -> (param) { where("score > ?",param)}
 
=begin
  #Se deja en este comentaro multiple los querries anteriores
  scope :counthigherthan, -> (param) { where("score > ?",param).count} 
  scope :higherthan, -> (param) { where("score > ?",param)} 
=end
end
