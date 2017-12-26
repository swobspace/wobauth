require 'rails_helper'

RSpec.describe "wobauth/memberships/show", type: :view do
  let(:user) { FactoryBot.create(:user, sn: "Mustermann", givenname: "Max") }
  let(:group) { FactoryBot.create(:group, name: "XYZ" )}
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/memberships" }
    allow(controller).to receive(:action_name) { "index" }

    @membership = assign(:membership, Wobauth::Membership.create!(
      :group => group,
      :user => user,
      :auto => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Mustermann, Max/)
    expect(rendered).to match(/XYZ/)
    expect(rendered).to match(/false/)
  end
end
