require 'test_helper'

module Wobauth
  class UsersControllerTest < ActionController::TestCase
    fixtures :users
    set_fixture_class users: Wobauth::User

    setup do
      @user = users(:one)
      @routes = Wobauth::Engine.routes
      sign_in users(:admin)
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
        post :create, user: { 
          username: 'tester',
          password: 'test99',
          password_confirmation: 'test99',
          displayname: 'Meier Müller', 
          email: 'tester@example.org',
          givenname: 'Müller',
          sn: 'Meier',
          telephone: '0123 456789'
        }
      end

      assert_redirected_to user_path(assigns(:user))
    end

    test "should show user" do
      get :show, id: @user
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @user
      assert_response :success
    end

    test "should update user" do
      patch :update, id: @user, user: { displayname: @user.displayname, email: @user.email, givenname: @user.givenname, gruppen: @user.gruppen, sn: @user.sn, telephone: @user.telephone, username: @user.username }
      assert_redirected_to user_path(assigns(:user))
    end

    test "should destroy user" do
      assert_difference('User.count', -1) do
        delete :destroy, id: @user
      end

      assert_redirected_to users_path
    end

    test "should get all translations in index" do
      get :index
      assert_select "span[class=?]", "translation_missing", count: 0
    end

    test "should get all translations in show" do
      get :show, id: @user
      assert_select "span[class=?]", "translation_missing", count: 0
    end
  end
end
