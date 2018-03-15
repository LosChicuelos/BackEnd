class Clasificacion < ApplicationRecord
    has_many :productos

    validates_associated :productos

    validates :id, presence: true
    validates :nombre, presence: true
    validates :padre, presence: true
    
end
