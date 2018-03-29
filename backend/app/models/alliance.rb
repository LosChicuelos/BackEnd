class Alliance < ApplicationRecord
  has_one :approval, :class_name => "User"
  has_one :applicant, :class_name => "User"
end
