class Mensaje < ApplicationRecord
    belongs_to :usuario


    validates :id, presence: true
    validates :id, numericality: { message: "%{value} parece no ser un número" }
    validates :idemisor, presence: true
    validates :idemisor, numericality: { message: "%{value} parece no ser un número" }
    validates :iddestinatario, presence: true
    validates :iddestinatario, numericality: { message: "%{value} parece no ser un número" }
    validates :id presence: true
    validates :id presence: true
    validates :id presence: true
end
