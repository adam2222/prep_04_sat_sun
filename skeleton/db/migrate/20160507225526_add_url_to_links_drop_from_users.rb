class AddUrlToLinksDropFromUsers < ActiveRecord::Migration
  def change
    add_column :links, :url, :string
    remove_column :users, :url
  end
end
