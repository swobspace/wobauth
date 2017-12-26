require 'rails_helper'

RSpec.describe "wobauth/groups/edit", type: :view do
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/groups" }
    allow(controller).to receive(:action_name) { "edit" }

    @group = assign(:group, FactoryBot.create(:group))
  end

  it "renders the edit group form" do
    render

    assert_select "form[action=?][method=?]", wobauth.group_path(@group), "post" do
      assert_select "input[name=?]", "group[name]"
      assert_select "input[name=?]", "group[description]"
    end
  end
end
