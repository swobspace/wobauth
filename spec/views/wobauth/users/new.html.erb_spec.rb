require 'rails_helper'

RSpec.describe "wobauth/users/new", type: :view do
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/users" }
    allow(controller).to receive(:action_name) { "edit" }

    assign(:user, FactoryBot.build(:user))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", wobauth.users_path, "post" do
      assert_select "input[name=?]", "user[username]"
      assert_select "input[name=?]", "user[sn]"
      assert_select "input[name=?]", "user[givenname]"
      assert_select "input[name=?]", "user[displayname]"
      assert_select "input[name=?]", "user[telephone]"
      assert_select "input[name=?]", "user[email]"
      assert_select "input[name=?]", "user[password]"
      assert_select "input[name=?]", "user[password_confirmation]"
    end
  end
end
