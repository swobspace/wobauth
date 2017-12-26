require 'rails_helper'

RSpec.describe "wobauth/users/index", type: :view do
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/users" }
    allow(controller).to receive(:action_name) { "index" }

    assign(:users, [
      Wobauth::User.create!(
        :username => "max",
        :sn => "Mustermann",
        :givenname => "Max",
        :displayname => "Mustermann, Max",
        :telephone => "Telephone",
        :email => "max@example.net"
      ),
      Wobauth::User.create!(
        :username => "emma",
        :sn => "Mustermann",
        :givenname => "Emma",
        :displayname => "Mustermann, Emma",
        :telephone => "Telephone",
        :email => "emma@example.net"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "max".to_s, :count => 1
    assert_select "tr>td", :text => "emma".to_s, :count => 1
    assert_select "tr>td", :text => "Mustermann, Max".to_s, :count => 1
    assert_select "tr>td", :text => "Mustermann, Emma".to_s, :count => 1
    assert_select "tr>td", :text => "Telephone".to_s, :count => 2
    assert_select "tr>td", :text => "max@example.net".to_s, :count => 1
    assert_select "tr>td", :text => "emma@example.net".to_s, :count => 1
  end
end
