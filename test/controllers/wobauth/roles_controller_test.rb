require 'test_helper'

module Wobauth
  class RolesControllerTest < ActionController::TestCase
    fixtures :roles, :users
    set_fixture_class roles: Wobauth::Role, users: Wobauth::User

    setup do
      @role = roles(:one)
      sign_in users(:admin)
    end

    test "should get index" do
      get :index, use_route: :wobauth
      assert_response :success
      assert_not_nil assigns(:roles)
    end

    test "should show role" do
      get :show, id: @role, use_route: :wobauth
      assert_response :success
    end

    test "should get all translations in index" do
      get :index, use_route: :wobauth
      assert_select "span[class=?]", "translation_missing", count: 0
    end

    test "should get all translations in show" do
      get :show, id: @role, use_route: :wobauth
      assert_select "span[class=?]", "translation_missing", count: 0
    end
  end
end
