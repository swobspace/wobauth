require 'rails_helper'

RSpec.describe "wobauth/groups/show", type: :view do
  helper Wobauth::Engine.helpers

  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability } 
    allow(controller).to receive(:controller_name) { "wobauth/groups" } 
    allow(controller).to receive(:action_name) { "show" } 

    @group = assign(:group, Wobauth::Group.create!(
      :name => "Name",
      :description => "Description"
    ))
  end

  context "without assigned authorities and members" do
    it "renders attributes" do
      render
      expect(rendered).to match(/Name/)
      expect(rendered).to match(/Description/)
    end
  end

  context "with assigned authority" do
    let(:role)  { FactoryBot.create(:role, name: "XYZ") }
    let!(:auth) { FactoryBot.create(:authority, authorizable: @group, role: role) }

    it "renders attributes" do
      render
      expect(rendered).to match(/Name/)
      expect(rendered).to match(/Description/)
      expect(rendered).to match(/XYZ/)
    end
  end

  context "with assigned member" do
    let(:user)  { FactoryBot.create(:user, sn: "Mustermann", givenname: "Fritz") }
    let!(:member) { FactoryBot.create(:membership, group: @group, user: user) }

    it "renders attributes" do
      render
      expect(rendered).to match(/Name/)
      expect(rendered).to match(/Description/)
      expect(rendered).to match(/Mustermann, Fritz/)
    end
  end

end
