require 'test_helper'

module Wobauth
  class FixturesTest < ActiveSupport::TestCase
    fixtures :all
    set_fixture_class users: Wobauth::User

    test "user fixtures" do
      admin = users(:admin)
    end
  end
end
