class Alianza < ApplicationRecord
    belongs_to :usuario
    
    validates :usuariosolicitante, presence: true
    validates :usuarioconfirma, presence: true
    validates :comentario, allow_blank: true
    validates :confirmacion, allow_blank: true
    validates :id, numericality: { message: "%{value} parece no ser un número" }
end
