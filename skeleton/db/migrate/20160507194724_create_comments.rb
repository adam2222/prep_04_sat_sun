class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id, null: false
      t.integer :link_id, null: false
      t.timestamps null: false
    end

    add_index :users, :user_id
    add_index :users, :link_id
  end
end
