# == Schema Information
#
# Table name: classifications
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Classification < ApplicationRecord
    has_many :articles

    validates :name, presence: true, length: { minimum: 5, maximum: 50 }


end
