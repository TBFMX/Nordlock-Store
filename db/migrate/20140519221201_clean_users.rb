class CleanUsers < ActiveRecord::Migration

  def self.up
  	remove_column :users, :name
  	remove_column :users, :lastname
  	remove_column :users, :login_date
  	remove_column :users, :password_date
  end
  
end
