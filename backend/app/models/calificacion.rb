class Calificacion < ApplicationRecord
     belongs_to :pedido
     has_many :foto
     has_one :usuario
end
