class RemoveUserFromUsers < ActiveRecord::Migration
  def change
  	remove_column :user, :user, :string
  end
end
