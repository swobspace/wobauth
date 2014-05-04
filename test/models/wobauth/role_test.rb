require 'test_helper'

module Wobauth
  class RoleTest < ActiveSupport::TestCase
    should have_many(:authorities)
    should have_many(:users).through(:authorities).source(:authorizable)

    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
  end
end
