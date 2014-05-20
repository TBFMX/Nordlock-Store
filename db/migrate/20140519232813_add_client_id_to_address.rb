class AddClientIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :client_id, :interger
  end
end
