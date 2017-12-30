require 'rails_helper'
require "cancan/matchers"

module Wobauth
  auth_models = [ Wobauth::User, Wobauth::Role, Wobauth::Group,
                  Wobauth::Authority, Wobauth::Membership ]

  RSpec.describe "User", :type => :model do
    fixtures :roles
    set_fixture_class roles: Wobauth::Role

    subject(:ability) { Wobauth::AdminAbility.new(user) }

    context "with role Admin" do
      let(:user) { FactoryBot.create(:user) }
      let!(:authority) {
	FactoryBot.create(:authority,
	  authorizable: user,
	  role: roles(:admin))
      }
      it { is_expected.to be_able_to(:manage, :all) }
    end

    context "with role UserAdmin" do
      let(:user) { FactoryBot.create(:user) }
      let!(:authority) {
	FactoryBot.create(:authority,
	  authorizable: user,
	  role: roles(:user_admin))
      }
      it { is_expected.to be_able_to(:manage, :all) }
    end

    context "with role OrgaAdmin" do
      let(:user) { FactoryBot.create(:user) }
      let!(:authority) {
	FactoryBot.create(:authority,
	  authorizable: user,
	  role: roles(:orga_admin))
      }
      it { is_expected.to be_able_to(:read, :all) }

      (auth_models).each do |model|
	context "on model #{model}" do
	  it { is_expected.to be_able_to(:read, model.new) }
	  it { is_expected.not_to be_able_to(:create, model.new) }
	  it { is_expected.not_to be_able_to(:update, model.new) }
	  it { is_expected.not_to be_able_to(:destroy, model.new) }
	  it { is_expected.not_to be_able_to(:manage, model.new) }
	end
      end
    end
  end
end
