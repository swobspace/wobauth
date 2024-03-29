require 'rails_helper'

module Wobauth
  RSpec.describe Groups::AuthoritiesController, type: :controller do
    routes { Wobauth::Engine.routes }

    fixtures :users, :roles
    set_fixture_class users: Wobauth::User, roles: Wobauth::Role

    let(:group) { FactoryBot.create(:group) }
    let(:role) { FactoryBot.create(:role) }

    login_admin

    let(:valid_attributes) {
      FactoryBot.attributes_for(:authority, authorizable_id: group.id, authorizable_type: group.class.name, role_id: role.id)
    }

    let(:invalid_attributes) {
      {authorizable_id: nil, authorizable_type: nil}
    }

    let(:valid_session) { {} }

    describe "GET #index" do
      it "returns a success response" do
        authority = Authority.create! valid_attributes
        get :index, params: {group_id: group.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        authority = Authority.create! valid_attributes
        get :show, params: {group_id: group.to_param, id: authority.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {group_id: group.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        authority = Authority.create! valid_attributes
        get :edit, params: {group_id: group.to_param, id: authority.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Authority" do
          expect {
            post :create, params: {group_id: group.to_param, authority: valid_attributes}, session: valid_session
          }.to change(Authority, :count).by(1)
        end

        it "redirects to the created authority" do
          post :create, params: {group_id: group.to_param, authority: valid_attributes}, session: valid_session
          expect(response).to redirect_to(group_path(group, anchor: 'authorities'))
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {group_id: group.to_param, authority: invalid_attributes}, session: valid_session
          expect(response.status).to be 422
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {{
          valid_from: "2017-01-01", valid_until: "2017-10-31"
        }}

        it "updates the requested authority" do
          authority = Authority.create! valid_attributes
          put :update, params: {group_id: group.to_param, id: authority.to_param, authority: new_attributes}, session: valid_session
          authority.reload
          expect(authority.valid_from.to_s).to eq "2017-01-01"
          expect(authority.valid_until.to_s).to eq "2017-10-31"
        end

        it "redirects to the authority" do
          authority = Authority.create! valid_attributes
          put :update, params: {group_id: group.to_param, id: authority.to_param, authority: valid_attributes}, session: valid_session
          expect(response).to redirect_to(group_path(group, anchor: 'authorities'))
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          authority = Authority.create! valid_attributes
          put :update, params: {group_id: group.to_param, id: authority.to_param, authority: invalid_attributes}, session: valid_session
          expect(response.status).to be 422
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested authority" do
        authority = Authority.create! valid_attributes
        expect {
          delete :destroy, params: {group_id: group.to_param, id: authority.to_param}, session: valid_session
        }.to change(Authority, :count).by(-1)
      end

      it "redirects to the authorities list" do
        authority = Authority.create! valid_attributes
        delete :destroy, params: {group_id: group.to_param, id: authority.to_param}, session: valid_session
        expect(response).to redirect_to(group_path(group, anchor: 'authorities'))
      end
    end

  end
end
