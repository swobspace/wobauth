require 'test_helper'

module Wobauth
  class MembershipTest < ActiveSupport::TestCase
    should belong_to(:group)
    should belong_to(:user).class_name('User')

    should validate_presence_of(:user_id)
    should validate_presence_of(:group_id)
  end
end
