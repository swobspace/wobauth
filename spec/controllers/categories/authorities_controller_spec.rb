require 'rails_helper'

RSpec.describe Categories::AuthoritiesController, type: :controller do
  # routes { Wobauth::Engine.routes }

  fixtures :users, :roles
  set_fixture_class users: Wobauth::User, roles: Wobauth::Role

  let(:user) { FactoryBot.create(:user) }
  let(:role) { FactoryBot.create(:role) }
  let(:category) { Category.create(name: "quark") }

  login_admin

  let(:valid_attributes) {
    FactoryBot.attributes_for(:authority, authorizable_id: user.id, authorizable_type: user.class.name, role_id: role.id)
  }

  let(:invalid_attributes) {
    {authorizable_id: nil, authorizable_type: nil}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      authority = Wobauth::Authority.create! valid_attributes
      get :index, params: {category_id: category.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      authority = Wobauth::Authority.create! valid_attributes.merge(
                                               authorized_for_id: category.id,
                                               authorized_for_type: "Category"
                                             )
      get :show, params: {category_id: category.to_param, id: authority.to_param}, session: valid_session
      expect(response).to be_successful
      expect(assigns(:authority).authorizable).to eq(user)
      expect(assigns(:authority).authorized_for).to eq(category)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {category_id: category.to_param}, session: valid_session
      expect(response).to be_successful
      expect(assigns(:authority).authorized_for).to eq(category)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      authority = Wobauth::Authority.create! valid_attributes.merge(
                                               authorized_for_id: category.id,
                                               authorized_for_type: "Category"
                                             )
      get :edit, params: {category_id: category.to_param, id: authority.to_param}, session: valid_session
      expect(response).to be_successful
      expect(assigns(:authority).authorizable).to eq(user)
      expect(assigns(:authority).authorized_for).to eq(category)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Wobauth::Authority" do
	expect {
	  post :create, params: {category_id: category.to_param,authority: valid_attributes}, session: valid_session
	}.to change(Wobauth::Authority, :count).by(1)
      end

      it "redirects to the created authority" do
	post :create, params: {category_id: category.to_param,authority: valid_attributes}, session: valid_session
	expect(response).to redirect_to(category_path(category, anchor: 'authorities'))
        expect(assigns(:authority).authorizable).to eq(user)
        expect(assigns(:authority).authorized_for).to eq(category)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
	post :create, params: {category_id: category.to_param,authority: invalid_attributes}, session: valid_session
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
	authority = Wobauth::Authority.create! valid_attributes
	put :update, params: {category_id: category.to_param, id: authority.to_param, authority: new_attributes}, session: valid_session
	authority.reload
	expect(authority.valid_from.to_s).to eq "2017-01-01"
	expect(authority.valid_until.to_s).to eq "2017-10-31"
      end

      it "redirects to the authority" do
	authority = Wobauth::Authority.create! valid_attributes
	put :update, params: {category_id: category.to_param, id: authority.to_param, authority: valid_attributes}, session: valid_session
	expect(response).to redirect_to(category_path(category, anchor: 'authorities'))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
	authority = Wobauth::Authority.create! valid_attributes
	put :update, params: {category_id: category.to_param, id: authority.to_param, authority: invalid_attributes}, session: valid_session
	expect(response.status).to be 422
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested authority" do
      authority = Wobauth::Authority.create! valid_attributes
      expect {
	delete :destroy, params: {category_id: category.to_param, id: authority.to_param}, session: valid_session
      }.to change(Wobauth::Authority, :count).by(-1)
    end

    it "redirects to the authorities list" do
      authority = Wobauth::Authority.create! valid_attributes
      delete :destroy, params: {category_id: category.to_param, id: authority.to_param}, session: valid_session
      expect(response).to redirect_to(category_path(category, anchor: 'authorities'))
    end
  end

end
