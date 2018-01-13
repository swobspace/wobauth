require 'rails_helper'
require "cancan/matchers"
require 'wobauth/admin_ability'

module Wobauth
  class AdminAbility
    def extended(rights_for)
      can [:manage, :navigate], Wobauth::User
    end
  end

  RSpec.describe "User", :type => :model do
    fixtures :roles
    set_fixture_class roles: Wobauth::Role

    subject(:ability) { Wobauth::AdminAbility.new(user) }

    context "with role Extended" do
      let(:user) { FactoryBot.create(:user) }
      let(:role) { FactoryBot.create(:role, name: 'Extended') }
      let!(:authority) {
	FactoryBot.create(:authority,
	  authorizable: user,
	  role: role)
      }
      it { is_expected.to be_able_to(:manage, Wobauth::User) }
      it { is_expected.to be_able_to(:navigate, Wobauth::User) }
    end

  end
end
