# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  topic       :string
#  content     :text
#  date        :date
#  sender_id   :integer
#  receiver_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_messages_on_receiver_id  (receiver_id)
#  index_messages_on_sender_id    (sender_id)
#

class Message < ApplicationRecord
  has_one :sender, :class_name => "User"
  has_one :receiver, :class_name => "User"

  validates :topic, presence: true, length: { minimum: 5, maximum: 50 }
  validates :content, presence: true, length: { minimum: 10, maximum: 500 }
  validates :date, presence: true
  
  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).

  #Este query nos devuelve los mensajes que a enviado un usurario.
  scope :Messages_sent_by_user, ->(id_param) { where("sender_id = ?", id_param)}

  #Este query nos devuelve los mensajes que a recibido un usurario.
  scope :Messages_received_by_user, ->(id_param) { where("receiver_id = ?", id_param)}

=begin
  #Se deja en este comentaro multiple los querries anteriores
  scope :countexitlastweek, -> {where('created_at >= ?', 1.week.ago).count} 
  scope :lastweek, -> {where('created_at >= ?', 1.week.ago)} 
  
  def self.belongsalliance
    joins("
    INNER JOIN users  userapproval  ON messages.sender_id   = userapproval.id 
    INNER JOIN users  userapplicant ON messages.receiver_id = userapplicant.id
    INNER JOIN alliances ON alliances.applicant_id = userapplicant.id AND alliances.approval_id = userapproval.id"
    )
  end
=end
end
