require 'rails_helper'

RSpec.describe "wobauth/users/show", type: :view do
  helper Wobauth::Engine.helpers

  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/users" }
    allow(controller).to receive(:action_name) { "show" }

    @user = assign(:user, Wobauth::User.create!(
      :username => "Username",
      :sn => "Sn",
      :givenname => "Givenname",
      :displayname => "Displayname",
      :telephone => "Telephone",
      :email => "test@example.com",
      :title => "Dr.",
      :position => "CIO",
      :department => "Software Development",
      :company => "ACME Ltd."
    ))
  end

  context "without membership or authority" do
    it "renders attributes" do
      render
      expect(rendered).to match(/Username/)
      expect(rendered).to match(/Sn/)
      expect(rendered).to match(/Givenname/)
      expect(rendered).to match(/Displayname/)
      expect(rendered).to match(/Telephone/)
      expect(rendered).to match(/test@example.com/)
      expect(rendered).to match(/Dr./)
      expect(rendered).to match(/CIO/)
      expect(rendered).to match(/Software Development/)
      expect(rendered).to match(/ACME Ltd./)
    end
  end

  context "with an authority assigned" do
    let(:role)  { FactoryBot.create(:role, name: "XYZ") }
    let!(:auth) { FactoryBot.create(:authority, authorizable: @user, role: role) }

    it "renders attributes" do
      render
      expect(rendered).to match(/Username/)
      expect(rendered).to match(/Sn/)
      expect(rendered).to match(/Givenname/)
      expect(rendered).to match(/Displayname/)
      expect(rendered).to match(/Telephone/)
      expect(rendered).to match(/test@example.com/)
      expect(rendered).to match(/XYZ/)
      expect(rendered).to match(/Dr./)
      expect(rendered).to match(/CIO/)
      expect(rendered).to match(/Software Development/)
      expect(rendered).to match(/ACME Ltd./)
    end
  end

  context "with an group assigned" do
    let(:group)  { FactoryBot.create(:group, name: "Bitclan") }
    let!(:member) { FactoryBot.create(:membership, user: @user, group: group) }

    it "renders attributes" do
      render
      expect(rendered).to match(/Username/)
      expect(rendered).to match(/Sn/)
      expect(rendered).to match(/Givenname/)
      expect(rendered).to match(/Displayname/)
      expect(rendered).to match(/Telephone/)
      expect(rendered).to match(/test@example.com/)
      expect(rendered).to match(/Bitclan/)
      expect(rendered).to match(/Dr./)
      expect(rendered).to match(/CIO/)
      expect(rendered).to match(/Software Development/)
      expect(rendered).to match(/ACME Ltd./)
    end
  end
end
