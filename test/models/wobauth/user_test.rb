require 'test_helper'

module Wobauth
  class UserTest < ActiveSupport::TestCase
    should have_many(:authorities)
    should have_many(:roles).through(:authorities)
    should have_many(:memberships)
    should have_many(:group_roles).through(:groups).source(:roles)
    should have_many(:groups).through(:memberships)

    should validate_presence_of(:username)
    should validate_presence_of(:email)
    should validate_uniqueness_of(:username)

  end
end
