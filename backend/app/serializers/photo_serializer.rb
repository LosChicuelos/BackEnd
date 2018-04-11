# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  date       :date
#  photo      :binary
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PhotoSerializer < ActiveModel::Serializer
  attributes :id
end
