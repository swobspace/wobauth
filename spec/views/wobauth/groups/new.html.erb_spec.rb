require 'rails_helper'

RSpec.describe "wobauth/groups/new", type: :view do
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/groups" }
    allow(controller).to receive(:action_name) { "new" }

    assign(:group, FactoryBot.build(:group))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", wobauth.groups_path, "post" do
      assert_select "input[name=?]", "group[name]"
      assert_select "input[name=?]", "group[description]"
    end
  end
end
