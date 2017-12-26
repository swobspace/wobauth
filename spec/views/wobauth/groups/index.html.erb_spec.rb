require 'rails_helper'

RSpec.describe "wobauth/groups/index", type: :view do
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability } 
    allow(controller).to receive(:controller_name) { "wobauth/groups" } 
    allow(controller).to receive(:action_name) { "index" } 

    assign(:groups, [
      Wobauth::Group.create!(
        :name => "Name1",
        :description => "Description"
      ),
      Wobauth::Group.create!(
        :name => "Name2",
        :description => "Description"
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", :text => "Name1".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
