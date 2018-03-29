class User < ApplicationRecord
    has_many :articles
    has_many :questions

    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    validates :name, presence: true, length: {maximum: 30}
    validates :lastname, presence: true, length: {maximum: 30}
    validates :iddocument, presence: true, length: {minimum: 10, maximum: 20}
    validates :typedocument, presence: true, length: {maximum: 20}
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :latitude, presence: true, length: {minimum: 5, maximum: 30}
    validates :langitude, presence: true, length: {minimum: 5, maximum: 30}
    validates :password, presence: true, length: {minimum: 8, maximum: 20}
    
end
