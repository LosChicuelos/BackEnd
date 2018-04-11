# == Schema Information
#
# Table name: classifications
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ClassificationSerializer < ActiveModel::Serializer
  attributes :id, :name
end
