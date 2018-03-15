class Usuario < ApplicationRecord
    has_many :interrogantes
    has_many :productos
    has_many :pedidos
    has_many :calificacions

    validates_associated :interrogantes
    validates_associated :productos
    validates_associated :pedidos
    validates_associated :calificacions

    validates :id, presence: true
    validates :id, numericality: { message: "%{value} parece no ser un número" }
    validates :latitud, presence: true
    validates :latitud, numericality: { message: "%{value} parece no ser un número" }
    validates :longitud, presence: true
    validates :longitud, numericality: { message: "%{value} parece no ser un número" }
    
    validates :contrasena, presence: true
    validates :telefono, presence: true
    validates :correo, presence: true
    validates :tipoidentificacion, presence: true
    
    
    
end
