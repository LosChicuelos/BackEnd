class Classification < ApplicationRecord
    has_many :articles

    validates :name, presence: true, length: { minimum: 5, maximum: 50 }


end
