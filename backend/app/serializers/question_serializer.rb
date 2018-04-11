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

class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer, :user_id, :article_id, :created_at
end
