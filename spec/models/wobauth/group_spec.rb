require 'rails_helper'

module Wobauth
  RSpec.describe Group, type: :model do
    it { is_expected.to have_many(:authorities) }
    it { is_expected.to have_many(:roles).through(:authorities) }
    it { is_expected.to have_many(:memberships) }
    it { is_expected.to have_many(:users).through(:memberships).source(:user) }

    it { is_expected.to validate_presence_of(:name) }

    it "simple factory working" do
      f = FactoryBot.create(:group)
      g = FactoryBot.create(:group)
      expect(f).to validate_uniqueness_of(:name)
      expect(f).to be_valid
      expect(g).to be_valid
    end

  end
end
