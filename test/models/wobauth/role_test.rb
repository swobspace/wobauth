require 'test_helper'

module Wobauth
  class RoleTest < ActiveSupport::TestCase
    should have_many(:authorities)
    should have_many(:users).through(:authorities).source(:authorizable)
    should have_many(:groups).through(:authorities).source(:authorizable)

    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)

    should "simple factory working" do
      f = FactoryBot.create(:role)
      g = FactoryBot.create(:role)
      assert g.valid?
      assert f.valid?
    end

  end
end
