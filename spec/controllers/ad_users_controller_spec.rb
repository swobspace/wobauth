require 'rails_helper'

RSpec.describe Wobauth::AdUsersController, type: :controller do
  routes { Wobauth::Engine.routes }

  fixtures :users, :roles
  set_fixture_class users: Wobauth::User, roles: Wobauth::Role

  login_admin

  describe "GET #index" do
    context "without any params" do
      before(:each) do
        get :index
      end
      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:ad_users)).to match_array [] }
    end

    context "with param :query" do
      before(:each) do
        get :index, params: { query: ENV['LDAP_SEARCH_SN'] }
      end
      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:ad_users).nil?).to be_falsey }

    end
  end

end
