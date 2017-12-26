require 'rails_helper'

RSpec.describe "wobauth/memberships/edit", type: :view do
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/memberships" }
    allow(controller).to receive(:action_name) { "edit" }

    @membership = assign(:membership, FactoryBot.create(:membership))
  end

  it "renders the edit membership form" do
    render

    assert_select "form[action=?][method=?]", wobauth.membership_path(@membership), "post" do
      assert_select "select[name=?]", "membership[group_id]"
      assert_select "select[name=?]", "membership[user_id]"
      assert_select "input[name=?]", "membership[auto]", count: 0
    end
  end
end
