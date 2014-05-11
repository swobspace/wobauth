require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  fixtures :users, :roles
  set_fixture_class users: Wobauth::User, roles: Wobauth::Role
  
  should "show login link if not logged in" do
    get :index
    assert_response :success
    assert_match 'Login-Formular', response.body
    assert_select "a[href=?]", "/posts", count: 0
    assert_select "a[href=?]", "/categories", count: 0
    assert_select "a[href=?]", "/auth/authorities", count: 0
    assert_select "a[href=?]", "/auth/groups", count: 0
    assert_select "a[href=?]", "/auth/memberships", count: 0
    assert_select "a[href=?]", "/auth/roles", count: 0
  end

  should "show logout link if logged in" do
    login_admin
    get :index
    assert_response :success
    assert_match 'Ausloggen', response.body
    assert_select "a[href=?]", "/posts", count: 1
    assert_select "a[href=?]", "/categories", count: 1
    assert_select "a[href=?]", "/auth/authorities", count: 1
    assert_select "a[href=?]", "/auth/groups", count: 1
    assert_select "a[href=?]", "/auth/memberships", count: 1
    assert_select "a[href=?]", "/auth/roles", count: 1
  end

  should "show logout link if logged in" do
    login_user
    get :index
    assert_response :success
    assert_match 'Ausloggen', response.body
    assert_select "a[href=?]", "/posts", count: 1
    assert_select "a[href=?]", "/categories", count: 1
    assert_select "a[href=?]", "/auth/authorities", count: 0
    assert_select "a[href=?]", "/auth/groups", count: 0
    assert_select "a[href=?]", "/auth/memberships", count: 0
    assert_select "a[href=?]", "/auth/roles", count: 0
  end

  should "should get all translations in index" do
    sign_in users(:admin)
    get :index
    assert_select "span[class=?]", "translation_missing", count: 0
  end


end
