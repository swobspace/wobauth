require 'rails_helper'

RSpec.describe "wobauth/memberships/index", type: :view do
  let(:user1) { FactoryBot.create(:user, sn: "Mustermann", givenname: "Max", username: 'mmax') }
  let(:user2) { FactoryBot.create(:user, sn: "Mustermann", givenname: "Heike", username: 'mhei') }
  let(:group) { FactoryBot.create(:group, name: "XYZ" )}
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/memberships" }
    allow(controller).to receive(:action_name) { "index" }

    assign(:memberships, [
      Wobauth::Membership.create!(
        :group => group,
        :user => user1,
        :auto => false
      ),
      Wobauth::Membership.create!(
        :group => group,
        :user => user2,
        :auto => false
      )
    ])
  end

  it "renders a list of memberships" do
    render
    assert_select "tr>td", :text => "Mustermann, Max (mmax)".to_s, :count => 1
    assert_select "tr>td", :text => "Mustermann, Heike (mhei)".to_s, :count => 1
    assert_select "tr>td", :text => "XYZ".to_s, :count => 2
  end
end
