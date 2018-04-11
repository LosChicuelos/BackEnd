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

class AllianceSerializer < ActiveModel::Serializer
  attributes :id, :commentary, :approval_id, :applicant_id, :confirm
end
