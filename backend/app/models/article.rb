class Article < ApplicationRecord
  belongs_to :user
  belongs_to :classification
  has_many :photos
  has_many :questions
  has_many :sales
end
