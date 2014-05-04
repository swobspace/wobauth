require 'test_helper'

module Wobauth
  class AuthoritiesControllerTest < ActionController::TestCase
    fixtures :authorities
    set_fixture_class authorities: Wobauth::Authority
    setup do
      @authority = authorities(:one)
      @routes = Wobauth::Engine.routes
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

    test "should create authority" do
      assert_difference('Authority.count') do
        post :create, authority: { authorizable_id: @authority.authorizable_id, authorizable_type: @authority.authorizable_type, authorized_for_id: @authority.authorized_for_id, authorized_for_type: @authority.authorized_for_type, role_id: @authority.role_id, valid_from: @authority.valid_from, valid_until: @authority.valid_until }
      end

      assert_redirected_to authority_path(assigns(:authority))
    end

    test "should show authority" do
      get :show, id: @authority
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @authority
      assert_response :success
    end

    test "should update authority" do
      patch :update, id: @authority, authority: { authorizable_id: @authority.authorizable_id, authorizable_type: @authority.authorizable_type, authorized_for_id: @authority.authorized_for_id, authorized_for_type: @authority.authorized_for_type, role_id: @authority.role_id, valid_from: @authority.valid_from, valid_until: @authority.valid_until }
      assert_redirected_to authority_path(assigns(:authority))
    end

    test "should destroy authority" do
      assert_difference('Authority.count', -1) do
        delete :destroy, id: @authority
      end

      assert_redirected_to authorities_path
    end
  end
end