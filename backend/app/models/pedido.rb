class Pedido < ApplicationRecord
    belongs_to :producto
    has_many :calificacions

    validates_associated :calificacions

    validates :id, presence: true
    validates :id, numericality: { message: "%{value} parece no ser un número" }
    validates :idproducto, presence: true
    validates :idproducto, numericality: { message: "%{value} parece no ser un número" }
    validates :idusuariocomp, presence: true
    validates :idusuariocomp, numericality: { message: "%{value} parece no ser un número" }
    validates :idusuariovend, presence: true
    validates :idusuariovend, numericality: { message: "%{value} parece no ser un número" }
    validates :cantidad, presence: true
    validates :cantidad, numericality: { message: "%{value} parece no ser un número" }
    validates :monto, presence: true
    validates :monto, numericality: { message: "%{value} parece no ser un número" }
    validates :fecha, presence: true
end
