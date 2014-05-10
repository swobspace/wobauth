require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  fixtures :users
  set_fixture_class users: Wobauth::User

  should "show login link if not logged in" do
    get :index
    assert_response :success
    assert_match 'Login-Formular', response.body
    assert_select "a[href=?]", "/auth/authorities", count: 0
    assert_select "a[href=?]", "/auth/groups", count: 0
    assert_select "a[href=?]", "/auth/memberships", count: 0
    assert_select "a[href=?]", "/auth/roles", count: 0
  end

  should "show logout link if logged in" do
    sign_in users(:admin)
    get :index
    assert_response :success
    assert_match 'Ausloggen', response.body
    assert_select "a[href=?]", "/auth/authorities", count: 1
    assert_select "a[href=?]", "/auth/groups", count: 1
    assert_select "a[href=?]", "/auth/memberships", count: 1
    assert_select "a[href=?]", "/auth/roles", count: 1
  end

end
