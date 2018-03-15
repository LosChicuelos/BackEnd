class Producto < ApplicationRecord
    belongs_to :clasificacion
    belongs_to :usuario
    has_many :foto
    has_many :interrogante
end
