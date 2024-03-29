require 'rails_helper'

module Wobauth
  RSpec.describe UsersController, type: :controller do
    routes { Wobauth::Engine.routes }

    fixtures :users, :roles
    set_fixture_class users: Wobauth::User, roles: Wobauth::Role

    login_admin

    let(:valid_attributes) {
      FactoryBot.attributes_for(:user)
    }

    let(:invalid_attributes) {
      {username: nil}
    }

    let(:valid_session) { {} }

    describe "GET #index" do
      it "returns a success response" do
        user = User.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        user = User.create! valid_attributes
        get :show, params: {id: user.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        user = User.create! valid_attributes
        get :edit, params: {id: user.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new User" do
          expect {
            post :create, params: {user: valid_attributes}, session: valid_session
          }.to change(User, :count).by(1)
        end

        it "redirects to the created user" do
          post :create, params: {user: valid_attributes}, session: valid_session
          expect(response).to redirect_to(User.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {user: invalid_attributes}, session: valid_session
          expect(response.status).to be 422
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {{
          sn: "Mustermann", 
          givenname: "Maxe",
          displayname: "Mustermann, Maxe",
          telephone: "0123 456-7890",
          email: "m.mustermann@example.net",
          title: "Dr.",
          position: "CIO",
          department: "Development",
          company: "ACME Ltd.",
        }}

        it "updates the requested user" do
          user = User.create! valid_attributes
          put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
          user.reload
          expect(user.attributes.symbolize_keys).to include(new_attributes)
        end

        it "redirects to the user" do
          user = User.create! valid_attributes
          put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
          expect(response).to redirect_to(user)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          user = User.create! valid_attributes
          put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
          expect(response.status).to be 422
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested user" do
        user = User.create! valid_attributes
        expect {
          delete :destroy, params: {id: user.to_param}, session: valid_session
        }.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        user = User.create! valid_attributes
        delete :destroy, params: {id: user.to_param}, session: valid_session
        expect(response).to redirect_to(users_url)
      end
    end

  end
end
