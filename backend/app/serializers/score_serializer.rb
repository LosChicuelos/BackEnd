# == Schema Information
#
# Table name: scores
#
#  id           :integer          not null, primary key
#  commentary   :text
#  score        :integer
#  sale_id      :integer
#  qualified_id :integer
#  qualifier_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :commentary, :score, :sale_id, :qualified_id, :qualifier_id, :created_at
end
