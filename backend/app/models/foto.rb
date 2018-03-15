class Foto < ApplicationRecord
    belongs_to :imageable, :polymorphic => true

    validates :id, presence: true
    validates :id, numericality: { message: "%{value} parece no ser un número" }
    validates :fecha, presence: true
    validates :foto, presence: true
    validates :foto, presence: true
    
    
 
end
