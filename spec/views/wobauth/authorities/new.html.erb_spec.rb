require 'rails_helper'

RSpec.describe "wobauth/authorities/new", type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:role) { FactoryBot.create(:role, name: "XYZ") }

  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/authorities" }
    allow(controller).to receive(:action_name) { "new" }

    assign(:authority, FactoryBot.build(:authority, authorizable: user, role: role))
  end

  it "renders new authority form" do
    render

    assert_select "form[action=?][method=?]", wobauth.authorities_path, "post" do
      assert_select "select[name=?]", "authority[authorizable_id]"
      assert_select "select[name=?]", "authority[authorizable_type]"
      assert_select "select[name=?]", "authority[authorized_for_id]"
      assert_select "select[name=?]", "authority[authorized_for_type]"
      assert_select "select[name=?]", "authority[role_id]"
      assert_select "input[name=?]", "authority[valid_from]"
      assert_select "input[name=?]", "authority[valid_until]"
    end
  end
end
