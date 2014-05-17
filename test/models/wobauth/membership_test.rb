require 'test_helper'

module Wobauth
  class MembershipTest < ActiveSupport::TestCase
    should belong_to(:group)
    should belong_to(:user).class_name('Wobauth::User')

    should validate_presence_of(:user_id)
    should validate_presence_of(:group_id)

    should "simple factory working" do
      f = FactoryGirl.create(:membership)
      g = FactoryGirl.create(:membership)
      assert g.valid?
      assert f.valid?
    end
  end
end
