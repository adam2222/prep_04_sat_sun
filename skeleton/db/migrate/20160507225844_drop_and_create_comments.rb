class DropAndCreateComments < ActiveRecord::Migration
  def change
    drop_table :comments

    create_table :comments do |t|
      t.text :body
      t.integer :user_id, null: false
      t.integer :link_id, null: false
      t.timestamps null: false
    end

    add_index :comments, :user_id
    add_index :comments, :link_id
  end
end
