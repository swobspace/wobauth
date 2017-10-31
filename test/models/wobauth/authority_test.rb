require 'test_helper'

module Wobauth
  class AuthorityTest < ActiveSupport::TestCase
    should belong_to(:authorizable)
    should belong_to(:role)
    should belong_to(:authorized_for)

    should validate_presence_of(:authorizable_id)
    should validate_presence_of(:authorizable_type)
    should validate_presence_of(:role_id)

    should "simple factory working" do
      f = FactoryBot.create(:authority)
      g = FactoryBot.create(:authority)
      assert g.valid?
      assert f.valid?
    end

  end
end
