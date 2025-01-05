require 'rails_helper'

module Wobauth
  RSpec.describe "Authority", type: :feature, js: true do
    fixtures :users, :roles
    set_fixture_class users: Wobauth::User, roles: Wobauth::Role

    let(:cat) { Category.create(name: 'lastCategory') }
    let(:auth) do
      FactoryBot.create(:authority,
        authorizable: users(:one),
        role: roles(:two),
        authorized_for: cat
      )
    end

    describe "visit authority_path" do
      before(:each) do
        login_admin
        visit wobauth.authority_path(auth)
      end

      it "delete an existing authority" do
        expect(page).to have_content "one"
        expect(page).to have_content "Wobauth::User"
        expect(page).to have_content "RoleTwo"
        expect(page).to have_content "lastCategory"
        expect(page).to have_content "Category"
        expect {
          accept_confirm do
            find('button[title="Berechtigung löschen"]').click
          end
          sleep 1
        }.to change(Authority, :count).by(-1)
        expect(page).to have_css("table#wobauth_authorities")
        within 'div[data-controller="datatables"]' do
          expect(page).to have_content /Showing .* of #{Authority.count} entries/
        end
      end

      # it "edit an existing authority" do
      #   find('a[title="Berechtigung bearbeiten"]').click
      #   within "form#edit_authority_#{auth.id}" do
      #     select "RoleOne", from: "Rolle"
      #     select "", from: "Berechtigung auf/Typ"
      #   end
      #   click_button("Berechtigung aktualisieren")
      #   sleep 1
      #   expect(page).to have_content("Berechtigung erfolgreich aktualisiert")
      #   expect(page).to have_content("RoleOne")
      # end
    end
  end
end
