require 'test_helper'

module Wobauth
  class GroupTest < ActiveSupport::TestCase
    should have_many(:authorities)
    should have_many(:roles).through(:authorities)
    should have_many(:memberships)
    should have_many(:users).through(:memberships).source(:user)

    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)

    should "simple factory working" do
      f = FactoryBot.create(:group)
      g = FactoryBot.create(:group)
      assert g.valid?
      assert f.valid?
    end

  end
end
