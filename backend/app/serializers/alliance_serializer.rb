# == Schema Information
#
# Table name: alliances
#
#  id           :integer          not null, primary key
#  commentary   :text
#  confirm      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  applicant_id :integer
#  approval_id  :integer
#
# Indexes
#
#  index_alliances_on_applicant_id  (applicant_id)
#  index_alliances_on_approval_id   (approval_id)
#

class AllianceSerializer < ActiveModel::Serializer
  attributes :id, :commentary, :approval_id, :applicant_id, :confirm
end
