require 'test_helper'

module Wobauth
  class GroupsControllerTest < ActionController::TestCase
    fixtures :groups
    set_fixture_class groups: Wobauth::Group
    setup do
      @group = groups(:one)
      @routes = Wobauth::Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:groups)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create group" do
      assert_difference('Group.count') do
        post :create, group: { description: "text", name: "myadmin" }
      end

      assert_redirected_to group_path(assigns(:group))
    end

    test "should not create group with duplicate name" do
      assert_no_difference('Group.count') do
        post :create, group: { description: "text", name: @group.name }
      end
      assert_response :success
      assert_match "ist bereits vergeben", response.body
    end

    test "should show group" do
      get :show, id: @group
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @group
      assert_response :success
    end

    test "should update group" do
      patch :update, id: @group, group: { description: @group.description, name: @group.name }
      assert_redirected_to group_path(assigns(:group))
    end

    test "should destroy group" do
      assert_difference('Group.count', -1) do
        delete :destroy, id: @group
      end

      assert_redirected_to groups_path
    end
  end
end
