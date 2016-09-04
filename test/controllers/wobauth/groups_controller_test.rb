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
        post :create, params: { group: { description: "text", name: "myadmin" } }
      end

      assert_redirected_to group_path(assigns(:group))
    end

    test "should not create group with duplicate name" do
      assert_no_difference('Group.count') do
        post :create, params: { group: { description: "text", name: @group.name } }
      end
      assert_response :success
      assert_match "ist bereits vergeben", response.body
    end

    test "should show group" do
      get :show, params: { id: @group }
      assert_response :success
    end

    test "should get edit" do
      get :edit, params: { id: @group }
      assert_response :success
    end

    test "should get edit with specific title" do
      get :edit, params: { id: @group }
      assert_select "legend", text: "Gruppe überarbeiten"
    end

    test "should update group" do
      patch :update, params: { id: @group, group: { description: @group.description, name: @group.name } }
      assert_redirected_to group_path(assigns(:group))
    end

    test "should destroy group" do
      assert_difference('Group.count', -1) do
        delete :destroy, params: { id: @group }
      end

      assert_redirected_to groups_path
    end
    
    test "should get all translations in index" do
      get :index
      assert_select "span[class=?]", "translation_missing", count: 0
    end

    test "should get all translations in show" do
      get :show, params: { id: @group }
      assert_select "span[class=?]", "translation_missing", count: 0
    end

    test "should show group authorities" do
      role = FactoryGirl.create(:role, name: "Testrole")
      FactoryGirl.create(:authority, authorizable: @group, role: role)
      get :show, params: { id: @group }
      assert_select "div#group_roles" do
        assert_select "tbody tr[class=?]", "authority" do
          assert_select "td", text: "Testrole"
        end
      end
    end

    test "should show assigned memberships" do
      user = FactoryGirl.create(:user, sn: "Berlin", givenname: "Mike")
      FactoryGirl.create(:membership, user: user, group: @group)
      get :show, params: { id: @group }
      assert_select "div#group_memberships" do
        assert_select "tbody tr[class=?]", "membership" do
          assert_select "td", text: "Berlin, Mike"
        end
      end
    end


  end
end
