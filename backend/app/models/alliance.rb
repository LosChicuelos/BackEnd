# == Schema Information
#
# Table name: alliances
#
#  id           :integer          not null, primary key
#  commentary   :text
#  confirm      :string
#  approval_id  :integer
#  applicant_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Alliance < ApplicationRecord
  has_one :approval, :class_name => "User"
  has_one :applicant, :class_name => "User"

  validates :commentary, presence: true, length: { minimum: 5, maximum: 500 }
  validates :confirm, length: { minimum: 2, maximum: 8 }
end
