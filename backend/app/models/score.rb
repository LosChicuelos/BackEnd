class Score < ApplicationRecord
  belongs_to :sale
  belongs_to :user
end
