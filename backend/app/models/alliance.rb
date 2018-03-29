class Alliance < ApplicationRecord
  has_one :approval, :class_name => "User"
  has_one :applicant, :class_name => "User"

  validates :commentary, presence: true, length: { minimum: 5, maximum: 500 }
  validates :confirm, length: { minimum: 3, maximum: 8 }
end
