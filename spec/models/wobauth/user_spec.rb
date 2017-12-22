require 'rails_helper'

module Wobauth
  RSpec.describe User, type: :model do
    it { is_expected.to have_many(:authorities) }
    it { is_expected.to have_many(:roles).through(:authorities) }
    it { is_expected.to have_many(:memberships) }
    it { is_expected.to have_many(:group_roles).through(:groups).source(:roles) }
    it { is_expected.to have_many(:groups).through(:memberships) }

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to allow_value("").for(:email) }

    it "simple factory working" do
      f = FactoryBot.create(:user)
      g = FactoryBot.create(:user)
      expect(f).to validate_uniqueness_of(:username)
      expect(f).to be_valid
      expect(g).to be_valid
    end

  end
end
