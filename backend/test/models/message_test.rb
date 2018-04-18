# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  topic       :string
#  content     :text
#  date        :date
#  sender_id   :integer
#  receiver_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_messages_on_receiver_id  (receiver_id)
#  index_messages_on_sender_id    (sender_id)
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
