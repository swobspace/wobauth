class CreateWobauthRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :wobauth_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
