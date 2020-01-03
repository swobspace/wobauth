require 'rails_helper'

module Wobauth
  RSpec.describe Groups::MembershipsController, type: :controller do
    routes { Wobauth::Engine.routes }

    fixtures :users, :roles
    set_fixture_class users: Wobauth::User, roles: Wobauth::Role

    let(:user) { FactoryBot.create(:user) }
    let(:group) { FactoryBot.create(:group) }

    login_admin

    let(:valid_attributes) {
      FactoryBot.attributes_for(:membership, user_id: user.id, group_id: group.id)
    }

    let(:invalid_attributes) {
      {group_id: nil, user_id: nil}
    }

    let(:valid_session) { {} }

    describe "GET #index" do
      it "returns a success response" do
        membership = Membership.create! valid_attributes
        get :index, params: {group_id: group.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        membership = Membership.create! valid_attributes
        get :show, params: {group_id: group.to_param, id: membership.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {group_id: group.to_param, }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        membership = Membership.create! valid_attributes
        get :edit, params: {group_id: group.to_param, id: membership.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Membership" do
          expect {
            post :create, params: {group_id: group.to_param, membership: valid_attributes}, session: valid_session
          }.to change(Membership, :count).by(1)
        end

        it "redirects to the created membership" do
          post :create, params: {group_id: group.to_param, membership: valid_attributes}, session: valid_session
          expect(response).to redirect_to(group_path(group, anchor: 'memberships'))
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {group_id: group.to_param, membership: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {group_id: 234}
        }

        it "updates the requested membership" do
          membership = Membership.create! valid_attributes
          put :update, params: {group_id: group.to_param, id: membership.to_param, membership: new_attributes}, session: valid_session
          membership.reload
          expect(membership.group_id).to eq(234)
        end

        it "redirects to the membership" do
          membership = Membership.create! valid_attributes
          put :update, params: {group_id: group.to_param, id: membership.to_param, membership: valid_attributes}, session: valid_session
          expect(response).to redirect_to(group_path(group, anchor: 'memberships'))
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          membership = Membership.create! valid_attributes
          put :update, params: {group_id: group.to_param, id: membership.to_param, membership: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested membership" do
        membership = Membership.create! valid_attributes
        expect {
          delete :destroy, params: {group_id: group.to_param, id: membership.to_param}, session: valid_session
        }.to change(Membership, :count).by(-1)
      end

      it "redirects to the memberships list" do
        membership = Membership.create! valid_attributes
        delete :destroy, params: {group_id: group.to_param, id: membership.to_param}, session: valid_session
        expect(response).to redirect_to(group_path(group, anchor: 'memberships'))
      end
    end

  end
end
