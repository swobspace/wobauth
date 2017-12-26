require 'rails_helper'

module Wobauth
  RSpec.describe GroupsController, type: :controller do
    routes { Wobauth::Engine.routes }

    fixtures :users, :roles
    set_fixture_class users: Wobauth::User, roles: Wobauth::Role

    login_admin

    let(:valid_attributes) {
      FactoryBot.attributes_for(:group)
    }

    let(:invalid_attributes) {
      { name: nil }
    }

    let(:valid_session) { {} }

    describe "GET #index" do
      it "returns a success response" do
        group = Group.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        group = Group.create! valid_attributes
        get :show, params: {id: group.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        group = Group.create! valid_attributes
        get :edit, params: {id: group.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Group" do
          expect {
            post :create, params: {group: valid_attributes}, session: valid_session
          }.to change(Group, :count).by(1)
        end

        it "redirects to the created group" do
          post :create, params: {group: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Group.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {group: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {{
          description: "another text"
        }}

        it "updates the requested group" do
          group = Group.create! valid_attributes
          put :update, params: {id: group.to_param, group: new_attributes}, session: valid_session
          group.reload
          expect(group.description).to eq("another text")
        end

        it "redirects to the group" do
          group = Group.create! valid_attributes
          put :update, params: {id: group.to_param, group: valid_attributes}, session: valid_session
          expect(response).to redirect_to(group)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          group = Group.create! valid_attributes
          put :update, params: {id: group.to_param, group: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested group" do
        group = Group.create! valid_attributes
        expect {
          delete :destroy, params: {id: group.to_param}, session: valid_session
        }.to change(Group, :count).by(-1)
      end

      it "redirects to the groups list" do
        group = Group.create! valid_attributes
        delete :destroy, params: {id: group.to_param}, session: valid_session
        expect(response).to redirect_to(groups_url)
      end
    end

  end
end
