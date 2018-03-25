class Producto < ApplicationRecord
    belongs_to :clasificacion
    belongs_to :usuario
    has_many :fotos
    has_many :interrogantes

    validates_associated :fotos, :as => :imageable
    validates_associated :interrogantes

    validates :id, presence: true
    validates :id, numericality: { message: "%{value} parece no ser un número" }
    validates :idusuario, presence: true
    validates :idusuario, numericality: { message: "%{value} parece no ser un número" }
    validates :precio, presence: true
    validates :precio, numericality: { message: "%{value} parece no ser un número" }
    validates :inventario, presence: true
    validates :inventario, numericality: { message: "%{value} parece no ser un número" }

    validates :tipoproducto, presence: true
    validates :nombre, presence: true
    validates :descripcion, presence: true

    
end
