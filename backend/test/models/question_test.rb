# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :text
#  answer     :text
#  date       :date
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_questions_on_article_id  (article_id)
#  index_questions_on_user_id     (user_id)
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
