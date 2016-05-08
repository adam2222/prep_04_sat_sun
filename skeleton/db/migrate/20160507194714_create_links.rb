class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :users, :user_id
  end
end
# Users have a username, password_digest, and session_token.
# Links have a title and url; each belongs to a User.
# Comments have a body; each belongs to a User and a Link.
