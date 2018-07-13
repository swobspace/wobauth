require 'test_helper'

module Wobauth
  class UsersControllerTest < ActionController::TestCase
    fixtures :users, :roles
    set_fixture_class users: Wobauth::User, roles: Wobauth::Role

    setup do
      @user = users(:one)
      @routes = Wobauth::Engine.routes
      login_admin
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:users)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create user" do
      assert_difference('User.count') do
        post :create, params: { user: { 
          username: 'tester',
          password: 'test99',
          password_confirmation: 'test99',
          displayname: 'Meier Müller', 
          email: 'tester@example.org',
          givenname: 'Müller',
          sn: 'Meier',
          telephone: '0123 456789'
        } }
      end

      assert_redirected_to user_path(assigns(:user))
    end

    test "should show user" do
      get :show, params: { id: @user }
      assert_response :success
    end

    test "should get edit" do
      get :edit, params: { id: @user }
      assert_response :success
    end

    test "should update user" do
      patch :update, params: { id: @user, user: { displayname: @user.displayname, email: @user.email, givenname: @user.givenname, gruppen: @user.gruppen, sn: @user.sn, telephone: @user.telephone, username: @user.username } }
      assert_redirected_to user_path(assigns(:user))
    end

    test "should destroy user" do
      assert_difference('User.count', -1) do
        delete :destroy, params: { id: @user }
      end

      assert_redirected_to users_path
    end

    test "should get all translations in index" do
      get :index
      assert_select "span[class=?]", "translation_missing", count: 0
    end

    test "should get all translations in show" do
      get :show, params: { id: @user }
      assert_select "span[class=?]", "translation_missing", count: 0
    end

    test "should show user authorities" do
      role = FactoryBot.create(:role, name: "Testrole")
      FactoryBot.create(:authority, authorizable: @user, role: role)
      get :show, params: { id: @user }
      assert_select "div#user_roles" do
        assert_select "tbody tr[class=?]", "authority" do
          assert_select "td", text: "Testrole"
        end
      end
    end

    test "should show assigned memberships" do
      group = FactoryBot.create(:group, name: "Vereinsmeierei")
      FactoryBot.create(:membership, user: @user, group: group)
      get :show, params: { id: @user }
      assert_select "div#user_groups" do
        assert_select "tbody tr[class=?]", "membership" do
          assert_select "td", text: "Vereinsmeierei"
        end
      end
    end
  end
end
