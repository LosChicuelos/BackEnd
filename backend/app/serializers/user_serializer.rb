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

class UserSerializer < ActiveModel::Serializer
  attributes :id, :typeuser, :iddocument, :typedocument, :email, :phone, :latitude, :langitude, :password, :name, :lastname, :confirmation
end
