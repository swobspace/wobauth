class CreateWobauthMemberships < ActiveRecord::Migration
  def change
    create_table :wobauth_memberships do |t|
      t.references :user, index: true
      t.references :group, index: true
      t.boolean :auto, default: false

      t.timestamps
    end
  end
end
