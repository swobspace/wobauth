require 'test_helper'

module Wobauth
  class GroupsControllerTest < ActionController::TestCase
    fixtures :groups, :users, :roles
    set_fixture_class groups: Wobauth::Group, 
                      users: Wobauth::User, roles: Wobauth::Role
    setup do
      @group = groups(:one)
      @routes = Wobauth::Engine.routes
      login_admin
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

    test "should get new with specific title" do
      get :new
      assert_select "legend", text: "Neue Gruppe"
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

    test "should get edit with specific title" do
      get :edit, id: @group
      assert_select "legend", text: "Gruppe überarbeiten"
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
    
    test "should get all translations in index" do
      get :index
      assert_select "span[class=?]", "translation_missing", count: 0
    end

    test "should get all translations in show" do
      get :show, id: @group
      assert_select "span[class=?]", "translation_missing", count: 0
    end

  end
end
