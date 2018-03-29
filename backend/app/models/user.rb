class User < ApplicationRecord
    has_many :articles
    has_many :questions

    validates :name, presence: true
    validates :lastname, presence: true
    validates :iddocument, presence: true, length: {minimum: 10, maximum: 20}
    validates :typedocument, 
end
