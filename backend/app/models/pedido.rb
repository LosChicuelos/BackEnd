class Pedido < ApplicationRecord
    belongs_to :producto
    has_many :calificacion
end
