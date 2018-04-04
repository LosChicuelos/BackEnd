class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :commentary, :score, :sale_id, :qualified_id, :qualifier_id, :created_at
end
