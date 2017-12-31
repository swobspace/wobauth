require 'rails_helper'

RSpec.describe "wobauth/users/edit", type: :view do
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/users" }
    allow(controller).to receive(:action_name) { "edit" }

    @user = assign(:user, FactoryBot.create(:user))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", wobauth.user_path(@user), "post" do
      assert_select "input[name=?]", "user[username]"
      assert_select "input[name=?]", "user[sn]"
      assert_select "input[name=?]", "user[givenname]"
      assert_select "input[name=?]", "user[displayname]"
      assert_select "input[name=?]", "user[telephone]"
      assert_select "input[name=?]", "user[email]"
      assert_select "input[name=?]", "user[password]"
      assert_select "input[name=?]", "user[password_confirmation]"
      assert_select "input[name=?]", "user[title]"
      assert_select "input[name=?]", "user[position]"
      assert_select "input[name=?]", "user[department]"
      assert_select "input[name=?]", "user[company]"
    end
  end
end
