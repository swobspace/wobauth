require 'test_helper'

module Wobauth
  class RoleTest < ActiveSupport::TestCase
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
  end
end
