# == Schema Information
#
# Table name: scores
#
#  id           :integer          not null, primary key
#  commentary   :text
#  score        :integer
#  sale_id      :integer
#  qualified_id :integer
#  qualifier_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_scores_on_qualified_id  (qualified_id)
#  index_scores_on_qualifier_id  (qualifier_id)
#  index_scores_on_sale_id       (sale_id)
#

require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
