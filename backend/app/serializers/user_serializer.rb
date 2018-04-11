# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  typeuser     :string
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

class UserSerializer < ActiveModel::Serializer
  attributes :id, :typeuser, :iddocument, :typedocument, :email, :phone, :latitude, :langitude, :password, :name, :lastname
end
