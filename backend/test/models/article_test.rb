# == Schema Information
#
# Table name: articles
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  price             :decimal(, )
#  inventory         :integer
#  user_id           :integer
#  classification_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
