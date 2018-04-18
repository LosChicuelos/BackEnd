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
#  photos     :string
#
# Indexes
#
#  index_photos_on_article_id  (article_id)
#

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
