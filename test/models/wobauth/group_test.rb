require 'test_helper'

module Wobauth
  class GroupTest < ActiveSupport::TestCase
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
    should have_many(:memberships)
    should have_many(:users).through(:memberships).source(:user)
  end
end
