require 'test_helper'

module Wobauth
  class AuthoritiesControllerTest < ActionController::TestCase
    fixtures :authorities, :users, :roles
    set_fixture_class authorities: Wobauth::Authority, 
                      users: Wobauth::User, roles: Wobauth::Role
    setup do
      @authority = authorities(:one)
      @routes = Wobauth::Engine.routes
      login_admin
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:authorities)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should get new with preselected user" do
      user = FactoryGirl.create(:user)
      get :new, params: { user_id: user.to_param }
      assert_response :success
      assert_select "select#authority_authorizable_type" do
        assert_select "option[selected=?][value=?]", "selected", 'Wobauth::User'
      end
      assert_select "select#authority_authorizable_id" do
        assert_select "option[selected=?][value=?]", "selected", user.to_param
      end
    end

    test "should get new with preselected group" do
      group = FactoryGirl.create(:group)
      get :new, params: { group_id: group.to_param }
      assert_response :success
      assert_select "select#authority_authorizable_type" do
        assert_select "option[selected=?][value=?]", "selected", 'Wobauth::Group'
      end
      assert_select "select#authority_authorizable_id" do
        assert_select "option[selected=?][value=?]", "selected", group.to_param
      end
    end

    test "should create authority" do
      assert_difference('Authority.count') do
        post :create, params: { authority: { authorizable_id: @authority.authorizable_id, authorizable_type: @authority.authorizable_type, authorized_for_id: @authority.authorized_for_id, authorized_for_type: @authority.authorized_for_type, role_id: @authority.role_id, valid_from: @authority.valid_from, valid_until: @authority.valid_until } }
      end

      assert_redirected_to authority_path(assigns(:authority))
    end

    test "should show authority" do
      get :show, params: { id: @authority }
      assert_response :success
    end

    test "should get edit" do
      get :edit, params: { id: @authority }
      assert_response :success
    end

    test "should update authority" do
      patch :update, params: { id: @authority, authority: { authorizable_id: @authority.authorizable_id, authorizable_type: @authority.authorizable_type, authorized_for_id: @authority.authorized_for_id, authorized_for_type: @authority.authorized_for_type, role_id: @authority.role_id, valid_from: @authority.valid_from, valid_until: @authority.valid_until } }
      assert_redirected_to authority_path(assigns(:authority))
    end

    test "should destroy authority" do
      assert_difference('Authority.count', -1) do
        delete :destroy, params: { id: @authority }
      end

      assert_redirected_to authorities_path
    end

    test "should get all translations in index" do
      get :index
      assert_select "span[class=?]", "translation_missing", count: 0
    end

    test "should get all translations in show" do
      get :show, params: { id: @authority }
      assert_select "span[class=?]", "translation_missing", count: 0
    end
  end
end
