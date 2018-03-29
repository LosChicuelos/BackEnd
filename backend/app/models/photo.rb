class Photo < ApplicationRecord
  belongs_to :article

  validates :date, presence: true
  validates :photo, presence: true
end
