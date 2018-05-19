class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :message
      t.references :category, index: true

      t.timestamps
    end
  end
end
