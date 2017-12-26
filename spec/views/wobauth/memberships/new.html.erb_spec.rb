require 'rails_helper'

RSpec.describe "wobauth/memberships/new", type: :view do
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/memberships" }
    allow(controller).to receive(:action_name) { "new" }

    assign(:membership, FactoryBot.build(:membership))
  end

  it "renders new membership form" do
    render

    assert_select "form[action=?][method=?]", wobauth.memberships_path, "post" do
      assert_select "select[name=?]", "membership[group_id]"
      assert_select "select[name=?]", "membership[user_id]"
      assert_select "input[name=?]", "membership[auto]", count: 0
    end
  end
end
