class Foto < ApplicationRecord
    belongs_to :producto

    validates :id, presence: true
    validates :id, numericality: { message: "%{value} parece no ser un número" }
    validates :fecha, presence: true
    validates :idventa, presence: true
    validates :foto, presence: true
    validates :producto, allow_blank: true
    
 
end
