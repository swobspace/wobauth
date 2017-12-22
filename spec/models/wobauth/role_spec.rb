require 'rails_helper'

module Wobauth
  RSpec.describe Role, type: :model do
    it { is_expected.to have_many(:authorities) }
    it { is_expected.to have_many(:users).through(:authorities).source(:authorizable) }
    it { is_expected.to have_many(:groups).through(:authorities).source(:authorizable) }

    it { is_expected.to validate_presence_of(:name) }

    it "simple factory working" do
      f = FactoryBot.create(:role)
      g = FactoryBot.create(:role)
      expect(f).to validate_uniqueness_of(:name)
      expect(f).to be_valid
      expect(g).to be_valid
    end
  end
end
