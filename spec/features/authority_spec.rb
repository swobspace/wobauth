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
        # save_and_open_screenshot
        expect(page).to have_content "one"
        expect(page).to have_content "Wobauth::User"
        expect(page).to have_content "RoleTwo"
        expect(page).to have_content "lastCategory"
        expect(page).to have_content "Category"
        expect(Authority.count).to eq(12)
        accept_confirm do
          find('button[title="Berechtigung löschen"]').click
        end
        sleep 1
        expect(Authority.count).to eq(11)
        save_and_open_page
        expect(page).to have_css("table#wobauth_authorities")
        within 'div[data-controller="datatables"]' do
          expect(page).to have_content "Showing 1 to 10 of 11 entries"
        end
      end

      it "edit an existing authority" do
        skip
        find('a[title="Berechtigung bearbeiten"]').click
        sleep 1
        within "#modal-body" do
          find("trix-editor#authority").set("a description for t2 authority")
        end
        click_button("Berechtigung aktualisieren")
        sleep 1
        within "#ts_show_authority" do
          expect(page).to have_content("a description for t2 authority")
        end
        # save_and_open_screenshot()
      end
    end
  end
end