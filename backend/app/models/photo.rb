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

class Photo < ApplicationRecord
  belongs_to :article

  validates :date, presence: true
  validates :photo, presence: true
end
