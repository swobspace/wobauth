require 'rails_helper'

RSpec.describe "wobauth/roles/index", type: :view do
  before(:each) do
    assign(:roles, [
      FactoryBot.create(:role, name: "XYZ"),
      FactoryBot.create(:role, name: "ABC"),
    ])
  end

  it "renders a list of roles" do
    render
    assert_select "tr>td", :text => "XYZ".to_s, :count => 1
    assert_select "tr>td", :text => "ABC".to_s, :count => 1
  end
end
