require 'rails_helper'

RSpec.describe "wobauth/authorities/show", type: :view do
  let(:user) { FactoryBot.create(:user, sn: "Muster", givenname: "Max" ) }
  let(:role) { FactoryBot.create(:role, name: "XYZ") }
  let(:cat)  { Category.new(name: "MyCat5") }

  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "wobauth/authorities" }
    allow(controller).to receive(:action_name) { "show" }

    @authority = assign(:authority, Wobauth::Authority.create!(
      :authorizable => user,
      :authorized_for => cat,
      :role => role,
      :valid_from => "2017-01-01",
      :valid_until => "2017-09-30",

    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Muster, Max/)
    expect(rendered).to match(/Wobauth::User/)
    expect(rendered).to match(/XYZ/)
    expect(rendered).to match(/MyCat5/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/2017-01-01/)
    expect(rendered).to match(/2017-09-30/)
  end
end
