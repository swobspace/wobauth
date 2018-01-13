require 'rails_helper'

module Wobauth
  RSpec.describe User, type: :model do
    it { is_expected.to have_many(:authorities).dependent(:destroy) }
    it { is_expected.to have_many(:roles).through(:authorities) }
    it { is_expected.to have_many(:memberships).dependent(:destroy) }
    it { is_expected.to have_many(:group_roles).through(:groups).source(:roles) }
    it { is_expected.to have_many(:group_authorities).through(:groups).source(:authorities) }
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

    describe "#to_s" do
      let(:user) { FactoryBot.build(:user,
        sn: "Mustermann",
        givenname: "Max",
        username: "mustermax",
       )}

      context "without title" do
        it "returns sn, givenname (username)" do
          expect(user.to_s).to eq "Mustermann, Max (mustermax)"
          expect(user.name).to eq "Mustermann, Max (mustermax)"
        end
      end

      context "with title" do
        it "returns sn, title givenname (username)" do
          user.title = "Dr."
          expect(user.to_s).to eq "Mustermann, Dr. Max (mustermax)"
          expect(user.name).to eq "Mustermann, Dr. Max (mustermax)"
        end
      end

      context "without sn and givenname" do
        it "returns sn, givenname (username)" do
          user.sn = ""; user.givenname = ""
          expect(user.to_s).to eq "mustermax"
          expect(user.name).to eq "mustermax"
        end
      end
    end

  end
end
