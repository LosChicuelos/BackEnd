# == Schema Information
# Schema version: 20180510101801
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  typeuser               :string
#  iddocument             :string
#  typedocument           :string
#  phone                  :string
#  latitude               :string
#  langitude              :string
#  name                   :string
#  lastname               :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
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


    
    scope :paginatedef, -> (param){
        User.paginate(:page => param, :per_page => 12)
    }

    #///////// Querries /////////
    #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).

    #Este query nos devuelve la calificación promedio de un usuario, como vendedor.
    scope :seller_averange_score, -> (param) { 
        Sale.sales_per_user(param).joins("INNER JOIN scores ON scores.sale_id = sales.id").average("scores.score")
    }

    #Este query nos devuelve la calificación promedio de un usuario, como comprador.
    scope :buyer_averange_score, -> (param) { 
        Sale.purchases_per_user(param).joins("INNER JOIN scores ON scores.sale_id = sales.id").average("scores.score")
    }

    #Este query nos devuelve la cantidad calificación de un usuario, como comprador.
    scope :count_score, -> (param) { 
        Sale.purchases_per_user(param).joins("INNER JOIN scores ON scores.sale_id = sales.id").count
    }
    
    #Este query nos devuelve el id de un usuario, lo busca por email.
    scope :id_user, -> (param) { select("id").where("email == ?", param)}
    
    #Este query nos devuelve el email de un usuario, lo busca por id.
    scope :email_user, -> (param) { select("email").where("id == ?", param)}
    
    #Este query nos devuelve toda la informacion de un usuario, lo busca por id.
    scope :full_user, -> (param) { where("id == ?", param)}
    
    #Este query nos devuelve true si el usuario ya esta logueado, lo busca por id de usuario.
    scope :user_confirmation, -> (param) { User.find(param).confirmation}
    
    #Este query nos agrupa por mes.
    scope :group_month, -> { group('strftime("%m", users.created_at)')}

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
    
    #Este query nos devuelve true si existe algun usuario con el email especificado, de lo contrario devuleve false.
    def self.email_verification(param)
        self.id_user(param).present?
    end

end
