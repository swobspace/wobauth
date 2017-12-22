require 'rails_helper'

RSpec.describe "wobauth/roles/show", type: :view do
  before(:each) do
    @role = assign(:role, FactoryBot.create(:role, name: "XYZ"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/XYZ/)
  end
end
