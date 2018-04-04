class UserSerializer < ActiveModel::Serializer
  attributes :id, :typeuser, :iddocument, :typedocument, :email, :phone, :latitude, :langitude, :password, :name, :lastname
end
