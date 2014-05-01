require 'test_helper'

module Wobauth
  class RolesControllerTest < ActionController::TestCase
    fixtures :roles
    set_fixture_class roles: Wobauth::Role
    setup do
      @role = roles(:one)
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
  end
end
