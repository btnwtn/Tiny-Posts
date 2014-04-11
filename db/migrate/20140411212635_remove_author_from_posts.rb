class RemoveAuthorFromPosts < ActiveRecord::Migration
  def change
    remove_column :users, :author
  end
end
