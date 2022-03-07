class AdditionalFieldsToWobauthUser < ActiveRecord::Migration[5.1]
  def change
    add_column :wobauth_users, :title, :string, default: ""
    add_column :wobauth_users, :position, :string, default: ""
    add_column :wobauth_users, :department, :string, default: ""
    add_column :wobauth_users, :company, :string, default: ""
  end
end
