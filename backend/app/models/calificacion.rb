class Calificacion < ApplicationRecord
    belongs_to :pedido
    has_many :fotos
    has_one :usuario

    validates_associated :fotos
    validates_associated :usuario

    validates :id, presence: true
    validates :idcalificador, presence: true
    validates :idventa, presence: true
    validates :idcalificado, presence: true
    validates :comentario, allow_blank: true
    validates :id, numericality: { message: "%{value} parece no ser un número" }
    validates :prestigio, numericality: { message: "%{value} parece no ser un número" }
end
