class Interrogante < ApplicationRecord
    belongs_to :usuario
    belongs_to :producto

    validates :id, presence: true
    validates :id, numericality: { message: "%{value} parece no ser un número" }
    validates :idusuario, presence: true
    validates :idusuario, numericality: { message: "%{value} parece no ser un número" }
    validates :idproducto, presence: true
    validates :idproducto, numericality: { message: "%{value} parece no ser un número" }
    validates :pregunta, presence: true
    validates :fecha, presence: true
    validates :respuesta, allow_blank: true
end
