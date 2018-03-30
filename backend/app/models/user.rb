class User < ApplicationRecord
    has_many :alliance_approval, :class_name => 'Alliance', :foreign_key => 'approval_id'
    has_many :alliance_applicant, :class_name => 'Alliance', :foreign_key => 'applicant_id'

    has_many :sent_private_messages, :class_name => 'Message', :foreign_key => 'sender_id'
    has_many :received_private_messages, :class_name => 'Message', :foreign_key => 'receiver_id'

    has_many :sales_seler, :class_name => 'Sales', :foreign_key => 'seller_id'
    has_many :sales_buyer, :class_name => 'Sales', :foreign_key => 'buyer_id'

    has_many :score_qualified, :class_name => 'Score', :foreign_key => 'qualified_id'
    has_many :score_qualifier, :class_name => 'Score', :foreign_key => 'qualifier_id'

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
