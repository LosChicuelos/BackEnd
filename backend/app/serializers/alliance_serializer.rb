class AllianceSerializer < ActiveModel::Serializer
  attributes :id, :commentary, :approval_id, :applicant_id, :confirm
end
