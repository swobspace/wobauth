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
      :email => "test@example.com"
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
    end
  end
end
