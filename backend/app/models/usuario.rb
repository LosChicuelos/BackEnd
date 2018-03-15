class Usuario < ApplicationRecord
    has_many :interrogante
    has_many :producto
    has_many :pedido
    has_many :calificacion
end
