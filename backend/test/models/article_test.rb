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
# Indexes
#
#  index_articles_on_classification_id  (classification_id)
#  index_articles_on_user_id            (user_id)
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
