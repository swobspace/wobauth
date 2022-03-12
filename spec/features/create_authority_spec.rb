require 'rails_helper'

module Wobauth
  RSpec.describe "Create Authority", type: :feature, js: true do
    fixtures :users, :roles
    set_fixture_class users: Wobauth::User, roles: Wobauth::Role

    let!(:cat) { Category.create(name: 'lastCategory') }

    describe "visit authority_path" do
      before(:each) do
        login_admin
        visit wobauth.new_authority_path
      end

      it "create a new authority" do
        expect(page).to have_content("Berechtigung erstellen")
        expect(page).to have_css("#authority_authorizable_type")
        expect(page).to have_css("#authority_authorizable_id", visible: false)
        expect(page).to have_css("#authority_authorized_for_type")
        expect(page).to have_css("#authority_authorized_for_id", visible: false)
        within "form#new_authority" do
          select "Benutzer", from: "Authorisierbar/Typ"
          sleep 0.5
          select "one", from: "authority_authorizable_id"
          select "RoleOne", from: "Rolle"
          select "Kategorie", from: "Berechtigung auf/Typ"
          sleep 0.5
          select "lastCategory", from: "authority_authorized_for_id"
        end
        click_button("Berechtigung erstellen")
        sleep 0.5
        expect(page).to have_content("Berechtigung erfolgreich erstellt")
        expect(page).to have_content("one")
        expect(page).to have_content("RoleOne")
        expect(page).to have_content("lastCategory")
      end
    end
  end
end
