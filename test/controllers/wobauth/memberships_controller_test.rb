require 'test_helper'

module Wobauth
  class MembershipsControllerTest < ActionController::TestCase
    fixtures :memberships, :users, :roles
    set_fixture_class memberships: Wobauth::Membership, 
                      users: Wobauth::User, roles: Wobauth::Role
    setup do 
      @membership = memberships(:one)
      @routes = Wobauth::Engine.routes
      login_admin
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:memberships)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "get new should preselected user" do
      user = FactoryBot.create(:user)
      get :new, params: { user_id: user.to_param }
      assert_response :success
      assert_select "select#membership_user_id" do
        assert_select "option[selected=?][value=?]", "selected", user.to_param
      end
    end

    test "get new should preselected group" do
      group = FactoryBot.create(:group)
      get :new, params: { group_id: group.to_param }
      assert_response :success
      assert_select "select#membership_group_id" do
        assert_select "option[selected=?][value=?]", "selected", group.to_param
      end
    end

    test "should create membership" do
      assert_difference('Membership.count') do
        post :create, params: { membership: { auto: @membership.auto, group_id: @membership.group_id, user_id: @membership.user_id } }
      end

      assert_redirected_to membership_path(assigns(:membership))
    end

    test "should show membership" do
      get :show, params: { id: @membership }
      assert_response :success
    end

    test "should get edit" do
      get :edit, params: { id: @membership }
      assert_response :success
    end

    test "should update membership" do
      patch :update, params: { id: @membership, membership: { auto: @membership.auto, group_id: @membership.group_id, user_id: @membership.user_id } }
      assert_redirected_to membership_path(assigns(:membership))
    end

    test "should destroy membership" do
      assert_difference('Membership.count', -1) do
        delete :destroy, params: { id: @membership }
      end

      assert_redirected_to memberships_path
    end

    test "should get all translations in index" do
      get :index
      assert_select "span[class=?]", "translation_missing", count: 0
    end

    test "should get all translations in show" do
      get :show, params: { id: @membership }
      assert_select "span[class=?]", "translation_missing", count: 0
    end

  end
end
