# == Schema Information
# Schema version: 20180420045710
#
# Table name: users
#
#  id           :integer          not null, primary key
#  type         :string
#  iddocument   :string
#  typedocument :string
#  email        :string
#  phone        :string
#  latitude     :decimal(, )
#  langitude    :decimal(, )
#  password     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string
#  lastname     :string
#

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
    has_many :approvals, :class_name => "Alliance", :foreign_key => "approval_id"
    has_many :applicants, :class_name => "Alliance", :foreign_key => "applicant_id"

    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    validates :name, presence: true, length: {maximum: 30}
    validates :lastname, presence: true, length: {maximum: 30}
    validates :iddocument, presence: true, length: {minimum: 10, maximum: 20}
    validates :typedocument, presence: true, length: {maximum: 20}
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :latitude, presence: true, length: {minimum: 5, maximum: 30}
    validates :langitude, presence: true, length: {minimum: 5, maximum: 30}
    validates :password, presence: true, length: {minimum: 8, maximum: 20}
    
    scope :paginatedef, -> (param){
        User.paginate(:page => param, :per_page => 6)
    }

    #///////// Querries /////////
    #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).

    #Este query nos devuelve la calificación promedio de un usuario, como vendedor.

    #Este query nos devuelve la calificación promedio de un usuario, como comprador.
    scope :averange_score, -> (param) { 
        Sale.purchases_per_user(param).joins("INNER JOIN scores ON scores.sale_id = sales.id").average("scores.score")
    }

    #Este query nos devuelve la cantidad calificación de un usuario, como comprador.
    scope :count_score, -> (param) { 
        Sale.purchases_per_user(param).joins("INNER JOIN scores ON scores.sale_id = sales.id").count
    }
    
    #Este query nos devuelve el id de un usuario.
    scope :id_user, -> (param) { select("id").where("email == ?", param)}

=begin
    #Este query nos devuelve las calificación de un usuario, como comprador.
    scope :qualifications_score, -> (param) { 
        Sale.purchases_per_user(param).includes(:scores).joins("INNER JOIN scores ON scores.sale_id = sales.id")
    }
=end

    scope :fivebestsellercantity, ->{
        joins("INNER JOIN sales ON sales.seller_id   = users.id").
        group('users.id').
        order('count_id  desc').
        count('id').
        take(5)
    }
    
    scope :fivebestsellervalue, ->{
        select("sum(amount) as totalamount, users.* ").
        joins("INNER JOIN sales ON sales.seller_id   = users.id").
        group('users.id').
        order('totalamount  desc').
        take(5)
    }

end
