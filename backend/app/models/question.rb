# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :text
#  answer     :text
#  date       :date
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
#  belongs_to :user
  belongs_to :article
  
  validates :date, presence: true
  validates :question, presence: true, length: { minimum: 5, maximum: 200 }

  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).

  #Este query nos devuelve todas las preguntas realizadas por un usuario especifico.
  scope :belongsuser, ->(param){ joins("INNER JOIN users ON users.id = questions.user_id").where("users.id = ?",param)}
end
