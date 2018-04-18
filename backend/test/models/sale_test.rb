# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  date       :date
#  quantity   :integer
#  amount     :decimal(, )
#  seller_id  :integer
#  buyer_id   :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sales_on_article_id  (article_id)
#  index_sales_on_buyer_id    (buyer_id)
#  index_sales_on_seller_id   (seller_id)
#

require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
