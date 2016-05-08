class DropAndCreateLinks < ActiveRecord::Migration
  def change
    drop_table :links

    create_table :links do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.string :url, null:false

      t.timestamps null: false
    end

    add_index :links, :user_id
  end
end
