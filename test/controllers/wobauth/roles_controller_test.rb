require 'test_helper'

module Wobauth
  class RolesControllerTest < ActionController::TestCase
    fixtures :roles, :users
    set_fixture_class roles: Wobauth::Role, users: Wobauth::User

    setup do
      @role = roles(:one)
      @routes = Wobauth::Engine.routes
      login_admin
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:roles)
    end

    test "should show role" do
      get :show, params: { id: @role }
      assert_response :success
    end

    test "should get all translations in index" do
      get :index
      assert_select "span[class=?]", "translation_missing", count: 0
    end

    test "should get all translations in show" do
      get :show, params: { id: @role }
      assert_select "span[class=?]", "translation_missing", count: 0
    end

    test "should show assigned authorities" do
      user = FactoryBot.create(:user, sn: "Quark", givenname: "Guenter", username: 'bla')
      FactoryBot.create(:authority, authorizable: user, role: @role)
      get :show, params: { id: @role }
      assert_select "div#role_authorities" do
        assert_select "tbody tr[class=?]", "authority" do
          assert_select "td", text: "Quark, Guenter (bla)"
        end
      end
    end

  end
end
