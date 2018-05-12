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
  belongs_to :sender, :class_name => "User"
  belongs_to :receiver, :class_name => "User"

  validates :topic, presence: true, length: { minimum: 5, maximum: 50 }
  validates :content, presence: true, length: { minimum: 10, maximum: 500 }
  validates :date, presence: true
    
  scope :paginatedef, -> (param){
      Message.paginate(:page => param, :per_page => 6)
  }
  
  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).

  #Este query nos devuelve los mensajes que a enviado un usurario.
  scope :messages_sent_by_user, ->(id_param) { where("sender_id = ?", id_param)}

  #Este query nos devuelve los mensajes que a recibido un usurario.
  scope :messages_received_by_user, ->(id_param) { where("receiver_id = ?", id_param).includes(:sender)}
  
  def self.messages_received_by_user2(param)
    messas = Message.messages_received_by_user(param);
    messas.each do |message|
      message.sender
    end
    messas2 = messas
  end

  scope :belongsuser, ->(id_param) { where("receiver_id = ? or sender_id = ?", id_param,id_param)}
  scope :countexitlastweek, -> {where('created_at >= ?', 1.week.ago).count} 
  scope :lastweek, -> {where('created_at >= ?', 1.week.ago)} 
  
  def self.belongsalliance
    joins("
    INNER JOIN users  userapproval  ON messages.sender_id   = userapproval.id 
    INNER JOIN users  userapplicant ON messages.receiver_id = userapplicant.id
    INNER JOIN alliances ON alliances.applicant_id = userapplicant.id AND alliances.approval_id = userapproval.id"
    )
  end

end
