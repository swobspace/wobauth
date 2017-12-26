require 'rails_helper'

RSpec.describe "wobauth/roles/show", type: :view do
  helper Wobauth::Engine.helpers

  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/roles" }
    allow(controller).to receive(:action_name) { "show" }

    @role = assign(:role, FactoryBot.create(:role, name: "XYZ"))
  end

  context "without assigned user" do
    it "renders attributes" do
      render
      expect(rendered).to match(/Rolle: XYZ/)
    end
  end

  context "with assigned user" do
    let(:user) { FactoryBot.create(:user, givenname: "Fritz", sn: "Mustermann") }
    let!(:auth) { FactoryBot.create(:authority, authorizable: user, role: @role) }
    it "renders attributes" do
      render
      expect(rendered).to match(/Rolle: XYZ/)
    end
  end
end
