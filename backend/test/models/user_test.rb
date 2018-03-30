# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  typeuser     :string
#  iddocument   :string
#  typedocument :string
#  email        :string
#  phone        :string
#  latitude     :decimal(, )
#  langitude    :decimal(, )
#  password     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string
#  lastname     :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
