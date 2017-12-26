require 'rails_helper'

RSpec.describe "wobauth/authorities/index", type: :view do
  let(:user) { FactoryBot.create(:user, sn: "Muster", givenname: "Max" ) }
  let(:role) { FactoryBot.create(:role, name: "XYZ") }
  let(:cat)  { Category.new(name: "MyCat5") }

  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/authorities" }
    allow(controller).to receive(:action_name) { "index" }

    assign(:authorities, [
      Wobauth::Authority.create!(
        :authorizable => user,
        :authorized_for => cat,
        :role => role,
        :valid_from => "2017-01-01",
        :valid_until => "2017-09-30",
      ),
      Wobauth::Authority.create!(
        :authorizable => user,
        :authorized_for => cat,
        :role => role
      )
    ])
  end

  it "renders a list of authorities" do
    render
    assert_select "tr>td", :text => "Muster, Max".to_s, :count => 2
    assert_select "tr>td", :text => "Wobauth::User".to_s, :count => 2
    assert_select "tr>td", :text => "XYZ".to_s, :count => 2
    assert_select "tr>td", :text => "MyCat5".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "2017-01-01".to_s, :count => 1
    assert_select "tr>td", :text => "2017-09-30".to_s, :count => 1
  end
end
